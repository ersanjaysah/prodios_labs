// locals variables
variable "project" {
  default = "My"
}

variable "created_by" {
  type    = string
  default = "Sanjay"
}


variable "cidr_block" {}
variable "public_subnets_cidr" {}
variable "public_subnet_AZ" {}
variable "private_subnet_cidr" {}
variable "private_subnet_AZ" {}
variable "ports" {}
variable "aws_instance_type" {}
