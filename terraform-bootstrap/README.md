# Terraform Bootstrap

## Build

1. Run `terraform init`
2. Run `terraform apply -auto-approve`
3. Run `terraform init -force-copy`

## Destroy

1. In `main.tf`, change the terraform_state_backend module arguments as follows:

  ```terraform
    module "terraform_state_backend" {
      terraform_backend_config_file_path = ""
      force_destroy                      = true
    }
  ```

2. Run `terraform apply -target module.terraform_state_backend -auto-approve`
3. Run `terraform init -force-copy`
4. Run `terraform destroy -auto-approve`

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_terraform_state_backend"></a> [terraform\_state\_backend](#module\_terraform\_state\_backend) | cloudposse/tfstate-backend/aws | 0.38.1 |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
