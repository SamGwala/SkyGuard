variable "aws_region" {
  description = "AWS region where SkyGuard dev environment will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR of the vpc"
  type        = string
  default     =  "10.0.0.0/16" 
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "name" {
  default = "SkyGuard"
}

variable "environment" {
  default = "dev"
}

variable "owner" {
  default = "Sam Gwala"
}

variable "ami_id" {
  default = "ami-0b6d9d3d33ba97d99"
}

variable "instance_type" {
  default = "t3.micro"
}