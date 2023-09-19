resource "aws_s3_bucket" "this" {
  bucket = local.bucket_name

  dynamic "lifecycle_rule" {
    for_each = var.expiration_rules
    iterator = rule
    content {
      id      = "expiration-rule-${rule.key}"
      enabled = true
      prefix  = rule.value["prefix"]
      expiration {
        days = rule.value["days"]
      }
    }
  }

  dynamic "lifecycle_rule" {
    for_each = var.transition_rules
    iterator = rule
    content {
      id      = "transition-rule-${rule.key}"
      enabled = true
      prefix  = rule.value["prefix"]
      transition {
        days          = rule.value["days"]
        storage_class = rule.value["storage_class"]
      }
    }
  }

  tags = {
    Name   = local.bucket_name
    Backup = var.dr_backup
  }
}


resource "aws_s3_bucket_public_access_block" "bucket_public_access_block" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encrypt" {
  bucket = aws_s3_bucket.this.bucket
  rule {
    bucket_key_enabled = local.sse_config.bucket_key_enabled
    apply_server_side_encryption_by_default {
      sse_algorithm = local.sse_config.sse_algorithm
    }
  }
}


resource "aws_s3_bucket_versioning" "example" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = var.versioning
  }
}
