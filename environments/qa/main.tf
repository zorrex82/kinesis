module "bucket_code" {
  source      = "../../modules/bucket_s3"
  name        = var.bucket_code
  environment = var.env
}

resource "aws_s3_object" "this" {
  bucket = module.bucket_code.bucket.bucket
  key    = "code_deployment.zip"
  source = "../../deployment_files/code_deployment.zip"
}

module "raw_stream" {
  source = "../../modules/kinesis_stream"

  name            = "raw"
  retention_hours = 24
  metrics         = ["IncomingBytes", "OutgoingBytes"]
  stream_mode     = "PROVISIONED"
  shard_count     = 1
  environment     = var.env
}

module "consolidated_stream" {
  source = "../../modules/kinesis_stream"

  name            = "consolidated"
  retention_hours = 48
  metrics         = ["IncomingRecords", "OutgoingRecords"]
  stream_mode     = "ON_DEMAND"
  shard_count     = 1
  environment     = var.env
}

module "flink_analytics" {
  source             = "../../modules/kinesis_analytics"
  environment        = var.env
  name               = var.kinesis_analytics
  table_config       = var.table_config
  input_stream_arn   = module.raw_stream.arn
  output_stream_arn  = module.consolidated_stream.arn
  s3_bucket_code_arn = module.bucket_code.arn
  property_group = [
    {
      property_group_id = "kinesis.analytics.flink.run.options"
      property_map = {
        "python"  = "code_deployment/source/main.py",
        "jarfile" = "code_deployment/lib/PythonApplicationDependencies.jar"
      }
    },
    {
      property_group_id = "config.table.input"
      property_map = {
        "connector" = "kinesis",
        "stream"    = "input-test",
        "region"    = "us-east-2",
        "name"      = "data_stream"
      }
    },
    {
      property_group_id = "config.table.output"
      property_map = {
        "connector" = "kinesis",
        "stream"    = module.consolidated_stream.name,
        "region"    = "us-east-2",
        "name"      = "output_stream"
      }
    }
  ]
  s3_content_location = {
    bucket_arn = module.bucket_code.arn
    file_key   = aws_s3_object.this.key
  }
}

module "kinesis_firehose" {
  source                           = "../../modules/kinesis_firehose"
  environment                      = var.env
  name                             = var.kinesis_firehose
  glue_table                       = var.glue_table
  s3_path                          = var.s3_path
  s3_bucket_arn                    = "bucket s3 consolidated" #replace by: data.aws_s3_bucket.consolidated_data_bucket.arn
  kinesis_source_configuration_arn = module.consolidated_stream.arn
  data_format_conversion_configuration = [
    {
      enabled = true
      input_format_configuration = {
        deserializer = {
          hive_json_ser_de = [{}]
        }
      }
      output_format_configuration = {
        serializer = {
          parquet_ser_de = [{
            compression = "SNAPPY"
          }]
        }
      }
      schema_configuration = {
        database_name = var.glue_database
        table_name    = var.glue_table
      }
    }
  ]
}
