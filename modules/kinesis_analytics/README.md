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
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_stream.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_stream) | resource |
| [aws_iam_policy.analytics_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.reading_kinesis_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.writing_kinesis_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.kinesis_analytics_service_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.analytics_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.reading_kinesis_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.writing_kinesis_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kinesisanalyticsv2_application.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesisanalyticsv2_application) | resource |
| [aws_iam_policy_document.analytics_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.kinesis_analytics_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.reading_kinesis_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.writing_kinesis_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_checkpoint_configuration"></a> [checkpoint\_configuration](#input\_checkpoint\_configuration) | Enable checkpoint configuration when necessary | <pre>object({<br>    configuration_type = string<br>  })</pre> | <pre>{<br>  "configuration_type": "DEFAULT"<br>}</pre> | no |
| <a name="input_code_content_type"></a> [code\_content\_type](#input\_code\_content\_type) | Execution content types: PLAINTEXT, ZIPFILE | `string` | `"ZIPFILE"` | no |
| <a name="input_company"></a> [company](#input\_company) | Company name | `string` | `"company"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment where the resource should be created | `string` | n/a | yes |
| <a name="input_input_stream_arn"></a> [input\_stream\_arn](#input\_input\_stream\_arn) | input stream ARN | `string` | n/a | yes |
| <a name="input_monitoring_configuration"></a> [monitoring\_configuration](#input\_monitoring\_configuration) | Application monitoring parameters | <pre>object({<br>    configuration_type = string<br>    log_level          = string<br>    metrics_level      = string<br>  })</pre> | <pre>{<br>  "configuration_type": "CUSTOM",<br>  "log_level": "INFO",<br>  "metrics_level": "TASK"<br>}</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | Application Name | `string` | n/a | yes |
| <a name="input_output_stream_arn"></a> [output\_stream\_arn](#input\_output\_stream\_arn) | Output stream ARN | `string` | n/a | yes |
| <a name="input_parallelism_configuration"></a> [parallelism\_configuration](#input\_parallelism\_configuration) | Parallel execution settings | <pre>object({<br>    auto_scaling_enabled = string<br>    configuration_type   = string<br>    parallelism          = string<br>    parallelism_per_kpu  = string<br>  })</pre> | <pre>{<br>  "auto_scaling_enabled": true,<br>  "configuration_type": "CUSTOM",<br>  "parallelism": 1,<br>  "parallelism_per_kpu": 1<br>}</pre> | no |
| <a name="input_project"></a> [project](#input\_project) | Project name | `string` | `"poc"` | no |
| <a name="input_property_group"></a> [property\_group](#input\_property\_group) | Execution Properties | <pre>list(object({<br>    property_group_id = string<br>    property_map      = map(any)<br>  }))</pre> | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"us-east-2"` | no |
| <a name="input_runtime_environment"></a> [runtime\_environment](#input\_runtime\_environment) | Execution environment, valid values: SQL-1\_0, FLINK-1\_6, FLINK-1\_8, FLINK-1\_11, FLINK-1\_13 | `string` | `"FLINK-1_13"` | no |
| <a name="input_s3_bucket_code_arn"></a> [s3\_bucket\_code\_arn](#input\_s3\_bucket\_code\_arn) | ARN name of the bucket used | `string` | n/a | yes |
| <a name="input_s3_content_location"></a> [s3\_content\_location](#input\_s3\_content\_location) | Code content path | <pre>object({<br>    bucket_arn = string<br>    file_key   = string<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kinesisanalytics_application"></a> [kinesisanalytics\_application](#output\_kinesisanalytics\_application) | Kinesis Analytics Output Object |
