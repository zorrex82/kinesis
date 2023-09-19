resource "aws_cloudwatch_log_group" "this" {
  name = local.name_cloudwatch_lg
}

resource "aws_cloudwatch_log_stream" "this" {
  name           = local.name_cloudwatch_ls
  log_group_name = aws_cloudwatch_log_group.this.name
}