output "kinesisanalytics_application" {
  value       = aws_kinesisanalyticsv2_application.this
  description = "Kinesis Analytics Output Object"
}

output "arn" {
  value = aws_kinesisanalyticsv2_application.this.arn
  description = "Kinesis Analytics Output arn"
}