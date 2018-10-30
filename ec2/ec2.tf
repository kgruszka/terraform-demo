provider "aws" {
  region  = "eu-central-1"
  profile = "606609185801"
}

resource "aws_instance" "demo-ec2" {
  # AMI: ami-d03c0acd ubuntu-trusty-14.04 HVM
  ami           = "ami-0b9fee3a2d0596ed1"
  instance_type = "t2.micro"

  subnet_id = "subnet-059a21604656926e3"

  tags {
    Name = "terraform-demo"
  }
}
