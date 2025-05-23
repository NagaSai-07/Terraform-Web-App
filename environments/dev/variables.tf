variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "azs" {
  default = ["ap-south-1a", "ap-south-1b"]
}

variable "project" {
  default = "dev"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "terraform"
}

variable "ami_id" {
  default = "ami-0af9569868786b23a"
}

variable "public_key_path" {
  description = "Path to the SSH public key"
  type        = string
  default = "C:/Users/nagas/.ssh/id_ed25519.pub"
}