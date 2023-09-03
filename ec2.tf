provider "aws" {
  region = "ap-south-1" # Set your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-06f621d90fa29f6d0" # Specify the AMI ID for your desired OS
  instance_type = "t2.micro" # Specify the instance type

  tags = {
    Name = "ExampleEC2"
  }
}

resource "aws_security_group" "allow_ssm" {
  name        = "allow-ssm"
  description = "Allow AWS SSM Session Manager access"
  
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSM access from anywhere. Adjust as needed.
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "example" {
  key_name   = "example-key" # Replace with your own key pair name
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAuw98gxryR/KaqukOusTibvgJ0naK9aSvs2hgkoUMtblED1dN8oFdDI3sRZOvsX0WaB/sU8DqJk3hhfTHKNHXwev9zmJeMpqYc1XqEvhzBsaHgQGU5A9LjnvS/7miJQTUhAXKFt09olEDlcPj13TbW6gxGlt6ZUbhJxMHpJfwhXjMeGd8WM8aO8T+qIQNq38OY8eC/8GzoCbGBb4XVp1Lj1D2hnRqOnIoPAnWIBkQfLm/SpJPxN0nG1YSVGs7jUuWoI3CQoaTURLLwxMXM9PTeB8NACYsG8gKK+HJGZLb9l3CqXXjz9ZSSvo36qcjirg2cAnqB3miT+GZpKQlL/w9" # Replace with your public key here
}
