variable "region" {
  type = string

  default = "us_east_2"

}

variable "env" {
  type = string

}

variable "bucket_code" {
  type    = string
  default = "code"

}

variable "kinesis_stream" {
  type = string

  default = "stream"

}

variable "kinesis_analytics" {
  type = string

  default = "analytics"

}

variable "kinesis_firehose" {
  type    = string
  default = "firehose"
}

variable "glue_database" {
  type = string

  default = "database"

}

variable "glue_table" {
  type = string

  default = "table"
}

variable "table_config" {
  type    = string
  default = "path/to/schema.json"
}

variable "s3_path" {
  type = string
  description = "path to s3 bucket"
  default = "s3://path/to/s3path"
}