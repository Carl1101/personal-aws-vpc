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
