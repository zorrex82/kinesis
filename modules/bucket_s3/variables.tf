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
  description = "Bucket name."
}

variable "sse_type" {
  type        = string
  default     = "SSE-KMS"
  description = "Type of Server-Side encryption to be used. Allowed values: `SSE-KMS` and `SSE-S3`. Ref: https://docs.aws.amazon.com/AmazonS3/latest/userguide/serv-side-encryption.html"
  validation {
    condition     = contains(["SSE-KMS", "SSE-S3"], var.sse_type)
    error_message = "Invalid encryption type. Valid values: SSE-KMS and SSE-S3."
  }
}

variable "versioning" {
  type        = string
  default     = "Disabled"
  description = "Enable object versioning in the bucket."
}

variable "logging_enable" {
  type        = bool
  default     = false
  description = "Bucket logging enable flag."
}

variable "logging_config" {
  type = object({
    prefix : string,
    lifecycle_thresholds : list(number)
  })
  default = {
    prefix               = ""
    lifecycle_thresholds = [30, 90, 180]
  }
  description = "Bucket logging configuration."
}

variable "expiration_rules" {
  type = list(object({
    prefix : string,
    days : number
  }))
  default     = []
  description = "Expiration rules for bucket objects."
}

variable "transition_rules" {
  type = list(object({
    prefix : string,
    days : number,
    storage_class : string
  }))
  default     = []
  description = "Bucket object Storage Class transition rules."
}

variable "dr_backup" {
  type        = bool
  default     = false
  description = "Enable DR Backup"
}


variable "data_access" {
  type        = string
  default     = "public"
  description = "Data access type, can be anonymous, public"
  validation {
    condition     = contains(["public", "anonymous"], var.data_access)
    error_message = "Invalid access type. Valid values: public and anonymous."
  }
}
