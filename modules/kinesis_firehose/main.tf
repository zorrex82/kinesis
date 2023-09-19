resource "aws_kinesis_firehose_delivery_stream" "this" {
  name        = local.name
  destination = "extended_s3"

  kinesis_source_configuration {
    kinesis_stream_arn = var.kinesis_source_configuration_arn
    role_arn           = aws_iam_role.kinesis_firehose_service_role.arn
  }

  extended_s3_configuration {
    role_arn            = aws_iam_role.kinesis_firehose_service_role.arn
    bucket_arn          = "arn" #replace by: data.aws_s3_bucket.consolidated_data_bucket.arn
    prefix              = "raw-stream/${var.s3_path}/"
    error_output_prefix = "raw-stream/errors/${var.s3_path}/"
    kms_key_arn         = "arn" #replace by: data.aws_kms_alias.kms_key.target_key_arn

    cloudwatch_logging_options {
      enabled         = true
      log_group_name  = "KDF-${var.glue_table}"
      log_stream_name = "S3Delivery"
    }
    
    dynamic "data_format_conversion_configuration" {
      iterator = i
      for_each = var.data_format_conversion_configuration != [] ? var.data_format_conversion_configuration : []
      content {
        enabled = lookup(i.value, "enabled", null)
        input_format_configuration {
          deserializer {
            dynamic "hive_json_ser_de" {
              for_each = [i.value.input_format_configuration.deserializer.hive_json_ser_de]
              content {
                timestamp_formats = try(hive_json_ser_de.value.timestamp_formats, null)
              }
            }

          }
        }
        output_format_configuration {
          serializer {


            dynamic "parquet_ser_de" {
              for_each = [i.value.output_format_configuration.serializer.parquet_ser_de]
              content {
                block_size_bytes              = try(parquet_ser_de.value.block_size_bytes, null)
                compression                   = try(parquet_ser_de.value.compression, null)
                enable_dictionary_compression = try(parquet_ser_de.value.enable_dictionary_compression, null)
                max_padding_bytes             = try(parquet_ser_de.value.max_padding_bytes, null)
                page_size_bytes               = try(parquet_ser_de.value.page_size_bytes, null)
                writer_version                = try(parquet_ser_de.value.writer_version, null)
              }
            }

          }
        }
        schema_configuration {
          catalog_id    = var.catalog_id
          role_arn      = aws_iam_role.kinesis_firehose_service_role.arn
          database_name = var.glue_database
          table_name    = var.glue_table
          region        = var.region
          version_id    = "LATEST"
        }
      }
    }
  }
}
