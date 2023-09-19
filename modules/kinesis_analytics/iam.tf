resource "aws_iam_role" "kinesis_analytics_service_role" {
  name               = local.name_role
  description        = "Kinesis Analytics Service Role"
  assume_role_policy = data.aws_iam_policy_document.kinesis_analytics_assume_role.json
  tags = {
    Name = local.name_role
  }
}


resource "aws_iam_policy" "reading_kinesis_stream" {
  name_prefix = local.name_policy
  description = "Kinesis stream origin reading policy"
  policy      = data.aws_iam_policy_document.reading_kinesis_stream.json
}

resource "aws_iam_role_policy_attachment" "reading_kinesis_stream" {
  role       = aws_iam_role.kinesis_analytics_service_role.name
  policy_arn = aws_iam_policy.reading_kinesis_stream.arn
}


resource "aws_iam_policy" "writing_kinesis_stream" {
  name_prefix = local.name_policy
  description = "Writing policy to the kinesis stream destination"
  policy      = data.aws_iam_policy_document.writing_kinesis_stream.json
}

resource "aws_iam_role_policy_attachment" "writing_kinesis_stream" {
  role       = aws_iam_role.kinesis_analytics_service_role.name
  policy_arn = aws_iam_policy.writing_kinesis_stream.arn
}


resource "aws_iam_policy" "analytics_s3" {
  name_prefix = local.name_policy
  description = "Access permission policy on the code that will be executed"
  policy      = data.aws_iam_policy_document.analytics_s3.json
}

resource "aws_iam_role_policy_attachment" "analytics_s3" {
  role       = aws_iam_role.kinesis_analytics_service_role.name
  policy_arn = aws_iam_policy.analytics_s3.arn
}
