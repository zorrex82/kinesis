data "aws_iam_policy_document" "kinesis_firehose_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["firehose.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "firehose_s3" {
  # remove the comment depends_on = [data.aws_s3_bucket.consolidated_data_bucket]
  statement {
    sid    = ""
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
      "data.aws_s3_bucket.consolidated_data_bucket.arn",
      "${data.aws_s3_bucket.consolidated_data_bucket.arn}/*"
    ]
  }
}

data "aws_iam_policy_document" "put_record" {
  statement {
    effect = "Allow"
    actions = [
      "firehose:PutRecord",
      "firehose:PutRecordBatch"
    ]
    resources = [
      var.kinesis_source_configuration_arn
    ]
  }
}

data "aws_iam_policy_document" "kinesis_firehose" {
  statement {
    sid    = ""
    effect = "Allow"
    actions = [
      "kinesis:DescribeStream",
      "kinesis:GetShardIterator",
      "kinesis:GetRecords",
      "kinesis:ListShards"
    ]
    resources = [
      var.kinesis_source_configuration_arn
    ]
  }
}

data "aws_iam_policy_document" "glue_get_table" {
  statement {
    effect = "Allow"
    actions = [
      "glue:GetTableVersions"
    ]
    resources = ["*"]
  }
}