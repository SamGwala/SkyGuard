#iam role 
resource "aws_iam_role" "main"{
  name = "${var.name}-Role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "${var.name}-Role"
    Environment = var.environment
    Owner       = var.owner

  }
}

#iam instance profile 
resource "aws_iam_instance_profile" "main"{
  name = "${var.name}-Instance-Profile"
  role = aws_iam_role.main.name
}

#ssm policy attachment 
resource "aws_iam_role_policy_attachment" "ssm"{
  role       = aws_iam_role.main.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    
}
    
#cloudwatch attachment 
resource "aws_iam_role_policy_attachment" "cloudwatch"{
  role       = aws_iam_role.main.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
    
}


