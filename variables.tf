variable "region" {
  description = "AWS Region targeted"
  default     = "us-east-1"
}
variable "vpc_cidr" {
  description = "CIDR Range for personal VPC"
}
variable "public_subnet_cidr" {
  description = "Public subnet CIDR range"
}
variable "private_subnets_cidr" {
  description = "Private subnet CIDR range"
}
