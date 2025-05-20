variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
}

variable "project" {
  description = "Project name for tagging"
  type        = string
}

variable "key_name" {
  description = "Name of the EC2 Key Pair"
  type        = string
}

variable "public_key_path" {
  description = "Path to the public key file"
  type        = string
}
