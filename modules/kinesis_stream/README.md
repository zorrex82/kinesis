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
| [aws_kinesis_stream.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_stream) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_company"></a> [company](#input\_company) | Company name | `string` | `"company"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment where the resource should be created | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Application Name | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project name | `string` | `"poc"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"us-east-1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for all resources. | `map(any)` | <pre>{<br>  "Application": "Analytics",<br>  "Environment": "dev",<br>  "IAC": true<br>}</pre> | no |

## Outputs

No outputs.
