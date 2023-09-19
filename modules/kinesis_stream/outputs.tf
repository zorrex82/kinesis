output "arn" {
  value = aws_kinesis_stream.this.arn
  description = "Kinesis Stream ARN"
}

output "name" {
  value = aws_kinesis_stream.this.name
  description = "Kinesis Stream Name"
}