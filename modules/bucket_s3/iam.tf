resource "aws_iam_policy" "app_policy" {
  name        = local.app_policy_name
  description = "Policy for accessing the bucket by the application."
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowS3",
        "Effect" : "Allow",
        "Action" : [
          "s3:ListBucket",
          "s3:GetBucketLocation",
          "s3:GetObject",
          "s3:GetObjectTagging",
          "s3:GetObjectAttributes",
          "s3:GetObjectVersion",
          "s3:GetObjectVersionTagging",
          "s3:GetObjectVersionAttributes",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:DeleteObjectVersion"
        ],
        "Resource" : [
          aws_s3_bucket.this.arn,
          "${aws_s3_bucket.this.arn}/*"
        ]
      }
    ]
  })
}