variable "region" {
  type        = string
  default     = "us-east-2"
  description = "AWS Region"
}


variable "company" {
  type        = string
  description = "Company name"
  default     = "company"
}

variable "project" {
  type        = string
  description = "Project name"
  default     = "poc"
}


variable "environment" {
  type        = string
  description = "Environment where the resource should be created"
  validation {
    condition     = contains(["dev", "qa", "prd"], var.environment)
    error_message = "Environment where the resource should be created. Accepted values are: dev, qa, prd"
  }
}

variable "kinesis_source_configuration_arn" {
  type        = string
  description = "Kinesis Data Stream ARN to configure as source"
}

variable "name" {
  type        = string
  description = "Application Name"
}


variable "s3_bucket_arn" {
  type        = string
  description = "ARN name of the bucket used"
}

variable "buffer_size" {
  type        = number
  description = "Buffer Size. Default 128"
  default     = 128
}

variable "buffer_interval" {
  type = number
  description = " Buffer incoming data for the specified period of time"
  default = 300  
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
  default     = null
}

variable "data_format_conversion_configuration" {
  type = list(object({
    enabled = bool
    input_format_configuration = object({
      deserializer = object({
        hive_json_ser_de = set(object({
          timestamp_formats = optional(string)
        }))
      })

    })
    output_format_configuration = object({
      serializer = object({
        parquet_ser_de = set(object({
          block_size_bytes              = optional(number)
          compression                   = optional(string)
          enable_dictionary_compression = optional(bool)
          max_padding_bytes             = optional(number)
          page_size_bytes               = optional(string)
          writer_version                = optional(string)

        }))
      })
    })
    schema_configuration = object({
      database_name = string
      table_name    = string
      role_arn      = optional(string)
      catalog_id    = optional(string)
      region        = optional(string)
      version_id    = optional(string)
    })
  }))

  description = "Conversion to Parquet or ORC"
  default     = []
}

variable "glue_table" {
  type = string
  description = "Table name for Glue Catalog"
}

variable "s3_path" {
  type = string
  description = "S3 Path for stream data."
}