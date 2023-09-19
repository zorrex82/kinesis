variable "region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-1"
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
  description = "Environment. Accepted values: 'dev', 'qa' , 'prd' "

  validation {
    condition     = contains(["dev", "qa", "prd"], var.environment)
    error_message = "Invalid environment value. Valid values: dev, qa, prd ."
  }

  default = "dev"
}