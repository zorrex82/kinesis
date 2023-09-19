resource "aws_kinesis_stream" "this" {
  name                = local.name
  retention_period    = var.retention_hours
  shard_level_metrics = var.metrics

  stream_mode_details {
    stream_mode = upper(var.stream_mode)
  }

  shard_count = var.stream_mode == "PROVISIONED" ? var.shard_count : 0

  # Enable encryption and specify the KMS Key ID or ARN
  encryption_type = "KMS"
  kms_key_id      = "KMS_ID" # replace by: data.aws_kms_alias.kms_key.target_key_arn

  tags = var.tags
}
