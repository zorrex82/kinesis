variable "region" {
  type        = string
  default     = "us-east-1"
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

variable "tags" {
  type = map(any)
  default = {
    Environment = "dev",
    Application = "Analytics",
    IAC         = true,
  }
  description = "Tags for all resources."
}

variable "shard_count" {
  type        = number
  description = "Number of shards"
}

variable "stream_mode" {
  type        = string
  description = "this field is required. Amazon has guidelines for specifying the Stream size that should be referenced when creating a Kinesis stream."
  default     = "PROVISIONED"
}

variable "retention_hours" {
  type        = number
  description = "Length of time data records are accessible after they are added to the stream."
}

variable "metrics" {
  type        = list(string)
  description = " A list of shard-level CloudWatch metrics which can be enabled for the stream."
}