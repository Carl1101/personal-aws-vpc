variable "region" {
  description = "AWS Region targeted"
  default     = "us-east-1"
  type        = string
}
variable "vpc_cidr" {
  description = "CIDR Range for personal VPC"
  type        = string
}
variable "public_subnet_cidr" {
  description = "Public subnet CIDR range"
  type        = string
}
variable "private_subnets_cidr" {
  description = "Private subnet CIDR range"
  type        = string
}
