resource "aws_instance" "demo-ec2" {
  # AMI: ami-d03c0acd ubuntu-trusty-14.04 HVM
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  subnet_id = "${var.subnet_id}"

  tags {
    Name = "terraform-demo"
  }
}
