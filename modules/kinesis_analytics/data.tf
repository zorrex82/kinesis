data "aws_iam_policy_document" "kinesis_analytics_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["kinesisanalytics.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "reading_kinesis_stream" {
  statement {
    sid    = "ReadInputKinesis"
    effect = "Allow"
    actions = [
      "kinesis:DescribeStream",
      "kinesis:GetShardIterator",
      "kinesis:GetRecords",
      "kinesis:ListShards"
    ]
    resources = [
      var.input_stream_arn
    ]
  }
}


data "aws_iam_policy_document" "writing_kinesis_stream" {
  statement {
    sid    = "WriteOutputKinesis"
    effect = "Allow"
    actions = [
      "kinesis:DescribeStream",
      "kinesis:PutRecord",
      "kinesis:PutRecords"
    ]
    resources = [
      var.output_stream_arn
    ]
  }
}


data "aws_iam_policy_document" "analytics_s3" {
  statement {
    sid    = "PermissionCodeBucket"
    effect = "Allow"
    actions = [
      "s3:AbortMultipartUpload",
      "s3:GetBucketLocation",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:PutObject"
    ]
    resources = [
      var.s3_bucket_code_arn,
      "${var.s3_bucket_code_arn}/*"
    ]
  }
}