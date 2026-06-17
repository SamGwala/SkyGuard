variable "ami_id"{
    description = "AMI ID of the EC2 instance"
    type        = string 

}

variable "instance_type"{
    description = "EC2 Instance Type"
    type        = string
}

variable "name"{
  description = "Project name"
  type        = string
}

variable "subnet_id"{
    description = "Subnet ID where the EC2 instance will be launched"
    type        = string
}

variable "instance_profile_name"{
    description = "IAM instance profile attached to EC2 instance" #remember we can't attach an IAM Role directly
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
