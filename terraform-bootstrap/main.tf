module "terraform_state_backend" {
  source = "cloudposse/tfstate-backend/aws"

  version                            = "0.38.1"
  namespace                          = "${data.aws_caller_identity.current.account_id}-terraform"
  stage                              = ""
  name                               = "state"
  terraform_backend_config_file_path = "."
  terraform_backend_config_file_name = "backend.tf"
  force_destroy                      = false
}

data "aws_caller_identity" "current" {}
