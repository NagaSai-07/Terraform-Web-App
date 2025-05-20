variable "project" {}
variable "vpc_cidr" {}
variable "public_subnets" {}
variable "private_subnets" {}
variable "azs" {}
variable "key_name" {
  description = "Name of the EC2 Key Pair"
  type        = string
}

variable "public_key_path" {
  description = "Path to the public key file"
  type        = string
}
