<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.23.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_repository.repository](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Deployment Environment | `string` | n/a | yes |
| <a name="input_registry_name"></a> [registry\_name](#input\_registry\_name) | The name of the registry. | `string` | n/a | yes |
| <a name="input_repository_force_delete"></a> [repository\_force\_delete](#input\_repository\_force\_delete) | Whether to force delete the repository. | `bool` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repository_url"></a> [repository\_url](#output\_repository\_url) | The URL of the repository. |
<!-- END_TF_DOCS -->