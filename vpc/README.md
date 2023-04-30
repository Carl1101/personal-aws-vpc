# Personal VPC

## Build

1. Run `terraform init -backend-config "bucket=$AWS_ACCOUNT_ID-terraform-state" -backend-config "dynamodb_table=$AWS_ACCOUNT_ID-terraform-state-lock"`
2. Run `terraform apply -auto-approve`

## Destroy

1. Run `terraform destroy -auto-approve`
