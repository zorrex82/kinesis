locals {
  bucket_name     = "${module.this.custom_context_id}.${var.name}.${var.data_access}"
  log_bucket_name = "${module.this.custom_context_id}.${var.name}.log.${var.data_access}"
  sse_config = var.sse_type == "SSE-KMS" ? {
    bucket_key_enabled = true,
    sse_algorithm      = "aws:kms"
    } : {
    bucket_key_enabled = null,
    sse_algorithm      = "AES256"
  }
  app_policy_name = "${module.this.custom_context_id}.${var.name}.policy.app.s3"
}