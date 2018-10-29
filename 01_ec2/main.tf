provider "aws" {
  region  = "eu-central-1"
  profile = "621041455573"
}

resource "aws_instance" "demo-ec2" {
  # AMI: ami-034bea563d2753cad ubuntu-trusty-14.04 HVM
  ami           = "ami-034bea563d2753cad"
  instance_type = "t2.micro"

  subnet_id = "subnet-059a21604656926e3"
}
