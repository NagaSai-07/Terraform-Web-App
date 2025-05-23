variable "project" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "vpc_id" {
  type = string
}

variable "instance_id" {
  type = string
}
