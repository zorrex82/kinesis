output "kinesis_firehose_application" {
  value       = aws_kinesis_firehose_delivery_stream.this
  description = "Kinesis analytics output object"
}