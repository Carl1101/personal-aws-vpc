provider "aws" {
  region = var.region
  default_tags {
    tags = {
      region     = var.region
      repository = "https://github.com/Carl1101/personal-aws-vpc"
      Terraform  = "true"
    }
  }
}
