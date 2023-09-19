## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_this"></a> [this](#module\_this) | ../name_convention | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.app_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.bucket_public_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.bucket_encrypt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_log"></a> [bucket\_log](#input\_bucket\_log) | name of bucket log | `string` | n/a | yes |
| <a name="input_company"></a> [company](#input\_company) | Company name | `string` | `"company"` | no |
| <a name="input_create_app_policy"></a> [create\_app\_policy](#input\_create\_app\_policy) | Indicates whether to create the access policy for applications. | `bool` | `false` | no |
| <a name="input_data_access"></a> [data\_access](#input\_data\_access) | Data access type, can be anonymous, public | `string` | `"public"` | no |
| <a name="input_dr_backup"></a> [dr\_backup](#input\_dr\_backup) | Enable DR Backup | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment where the resource should be created | `string` | n/a | yes |
| <a name="input_expiration_rules"></a> [expiration\_rules](#input\_expiration\_rules) | Expiration rules for bucket objects. | <pre>list(object({<br>    prefix : string,<br>    days : number<br>  }))</pre> | `[]` | no |
| <a name="input_logging_config"></a> [logging\_config](#input\_logging\_config) | Bucket logging configuration. | <pre>object({<br>    prefix : string,<br>    lifecycle_thresholds : list(number)<br>  })</pre> | <pre>{<br>  "lifecycle_thresholds": [<br>    30,<br>    90,<br>    180<br>  ],<br>  "prefix": ""<br>}</pre> | no |
| <a name="input_logging_enable"></a> [logging\_enable](#input\_logging\_enable) | Bucket logging enable flag. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Bucket name. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project name | `string` | `"poc"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"us-east-1"` | no |
| <a name="input_sse_type"></a> [sse\_type](#input\_sse\_type) | Type of Server-Side encryption to be used. Allowed values: `SSE-KMS` and `SSE-S3`. Ref: https://docs.aws.amazon.com/AmazonS3/latest/userguide/serv-side-encryption.html | `string` | `"SSE-KMS"` | no |
| <a name="input_transition_rules"></a> [transition\_rules](#input\_transition\_rules) | Bucket object Storage Class transition rules. | <pre>list(object({<br>    prefix : string,<br>    days : number,<br>    storage_class : string<br>  }))</pre> | `[]` | no |
| <a name="input_versioning"></a> [versioning](#input\_versioning) | Enable object versioning in the bucket. | `string` | `"Disabled"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_policy"></a> [app\_policy](#output\_app\_policy) | Access policy for applications. |
| <a name="output_arn"></a> [arn](#output\_arn) | Bucket ARN Information |
| <a name="output_bucket"></a> [bucket](#output\_bucket) | Bucket information |
