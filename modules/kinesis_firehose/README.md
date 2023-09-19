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
| [aws_cloudwatch_log_group.log_group_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_stream.log_stream_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_stream) | resource |
| [aws_iam_policy.firehose_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.glue_get_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.kinesis_firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.put_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.kinesis_firehose_service_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.firehose_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.glue_get_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.kinesis_firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.put_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kinesis_firehose_delivery_stream.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [aws_iam_policy_document.firehose_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.glue_get_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.kinesis_firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.kinesis_firehose_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.put_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_buffer_size"></a> [buffer\_size](#input\_buffer\_size) | Buffer Size. Default 128 | `number` | `128` | no |
| <a name="input_company"></a> [company](#input\_company) | Company name | `string` | `"company"` | no |
| <a name="input_data_format_conversion_configuration"></a> [data\_format\_conversion\_configuration](#input\_data\_format\_conversion\_configuration) | Conversion to Parquet or ORC | <pre>list(object({<br>    enabled = bool<br>    input_format_configuration = object({<br>      deserializer = object({<br>        hive_json_ser_de = set(object({<br>          timestamp_formats = optional(string)<br>        }))<br>      })<br><br>    })<br>    output_format_configuration = object({<br>      serializer = object({<br>        parquet_ser_de = set(object({<br>          block_size_bytes              = optional(number)<br>          compression                   = optional(string)<br>          enable_dictionary_compression = optional(bool)<br>          max_padding_bytes             = optional(number)<br>          page_size_bytes               = optional(string)<br>          writer_version                = optional(string)<br><br>        }))<br>      })<br>    })<br>    schema_configuration = object({<br>      database_name = string<br>      role_arn      = string<br>      table_name    = string<br>      catalog_id    = optional(string)<br>      region        = optional(string)<br>      version_id    = optional(string)<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment where the resource should be created | `string` | n/a | yes |
| <a name="input_kinesis_source_configuration_arn"></a> [kinesis\_source\_configuration\_arn](#input\_kinesis\_source\_configuration\_arn) | Kinesis Data Stream ARN to configure as source | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Application Name | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project name | `string` | `"poc"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"us-east-2"` | no |
| <a name="input_s3_bucket_arn"></a> [s3\_bucket\_arn](#input\_s3\_bucket\_arn) | ARN name of the bucket used | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kinesis_firehose_application"></a> [kinesis\_firehose\_application](#output\_kinesis\_firehose\_application) | Kinesis analytics output object |
