#create ec2 instance
resource "aws_instance" "main" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  subnet_id            = var.subnet_id
  iam_instance_profile = var.instance_profile_name

  tags = {
    Name        = "${var.name}-Node-01"
    Environment = var.environment
    Owner       = var.owner

  }
}