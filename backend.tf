terraform {
  backend "s3" {
    key     = "network.tfstate"
    encrypt = "true"
  }
}
