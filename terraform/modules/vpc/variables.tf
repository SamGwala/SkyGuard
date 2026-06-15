variable "vpc_cidr" {
  description = "CIDR of the vpc"
  type        = string
}

variable "public_subnet_cidr"{
  description = "CIDR for the public subnet"
  type        = string
}

variable "name"{
  description = "Project name"
  type        = string
}

variable "environment"{
  description = "Deployment environment"
  type        = string
}

variable "owner"{
  description = "Infrastructure owner"
  type        = string
}