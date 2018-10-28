data "terraform_remote_state" "bootstrap" {
  backend = "s3"

  config {
    bucket  = "terraform-demo-tfstate"
    key     = "demo/bootstrap.tfstate"
    region  = "eu-central-1"
    profile = "${local.aws_account_id}"
  }
}

data "aws_ami" "ecs" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-*-amazon-ecs-optimized"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["591542846629"] # Canonical
}

data "template_file" "ecs_user_data" {
  template = "${file("${path.module}/ecs-user-data/user-data.tpl")}"

  vars {
    cluster_name = "${aws_ecs_cluster.demo.name}"
  }
}

data "aws_caller_identity" "current" {}

locals {
  aws_account_id = "${data.aws_caller_identity.current.account_id}"

  vpc_id         = "${data.terraform_remote_state.bootstrap.vpc_id}"
  vpc_cidr_block = "${data.terraform_remote_state.bootstrap.vpc_cidr_block}"
  subnet_ids     = "${split(",", data.terraform_remote_state.bootstrap.subnet_ids)}"

  cluster_ami_id   = "${coalesce(var.cluster_ami_id, data.aws_ami.ecs.id)}"
  cluster_key_name = "${coalesce(var.cluster_key_name, data.terraform_remote_state.bootstrap.key_pair_name)}"
}
