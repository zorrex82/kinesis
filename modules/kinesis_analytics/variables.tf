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

variable "name" {
  type        = string
  description = "Application Name"
}


variable "runtime_environment" {
  type = string

  validation {
    condition     = contains(["SQL-1_0", "FLINK-1_6", "FLINK-1_8", "FLINK-1_11", "FLINK-1_13"], var.runtime_environment)
    error_message = "Invalid value for environment. Valid values: SQL-1_0, FLINK-1_6, FLINK-1_8, FLINK-1_11, FLINK-1_13 ."
  }
  default     = "FLINK-1_13"
  description = "Execution environment, valid values: SQL-1_0, FLINK-1_6, FLINK-1_8, FLINK-1_11, FLINK-1_13"
}


variable "s3_content_location" {
  type = object({
    bucket_arn = string
    file_key   = string
  })
  description = "Code content path"
}

variable "code_content_type" {
  type = string

  validation {
    condition     = contains(["PLAINTEXT", "ZIPFILE"], var.code_content_type)
    error_message = "Value for invalid content type. Valid values: PLAINTEXT, ZIPFILE ."
  }

  default     = "ZIPFILE"
  description = "Execution content types: PLAINTEXT, ZIPFILE"
}

variable "checkpoint_configuration" {
  type = object({
    configuration_type = string
  })
  default = {
    configuration_type = "DEFAULT"
  }
  description = "Enable checkpoint configuration when necessary"
}


variable "monitoring_configuration" {
  type = object({
    configuration_type = string
    log_level          = string
    metrics_level      = string
  })
  default = {
    configuration_type = "CUSTOM"
    log_level          = "INFO"
    metrics_level      = "TASK"
  }
  description = "Application monitoring parameters"
}


variable "parallelism_configuration" {
  type = object({
    auto_scaling_enabled = string
    configuration_type   = string
    parallelism          = string
    parallelism_per_kpu  = string
  })
  default = {
    auto_scaling_enabled = true
    configuration_type   = "CUSTOM"
    parallelism          = 1
    parallelism_per_kpu  = 1
  }
  description = "Parallel execution settings"
}


variable "property_group" {
  type = list(object({
    property_group_id = string
    property_map      = map(any)
  }))
  description = "Execution Properties"
}

variable "input_stream_arn" {
  type        = string
  description = "input stream ARN"
}

variable "output_stream_arn" {
  type        = string
  description = "Output stream ARN"
}

variable "s3_bucket_code_arn" {
  type        = string
  description = "ARN name of the bucket used"
}

variable "table_config" {
  type        = string
  description = "Path to json file with Table Config."
}