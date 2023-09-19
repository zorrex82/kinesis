output "bucket" {
  value       = aws_s3_bucket.this.bucket
  description = "Bucket information"
}

output "arn" {
  value       = aws_s3_bucket.this.arn
  description = "Bucket ARN Information"
}
