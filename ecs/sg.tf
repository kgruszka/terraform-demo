resource "aws_security_group" "cluster" {
  name        = "${var.cluster_name}"
  description = "Container access for cluster: ${var.cluster_name}"
  vpc_id      = "${local.vpc_id}"
}

resource "aws_security_group_rule" "ingress" {
  type = "ingress"

  security_group_id = "${aws_security_group.cluster.id}"

  protocol  = "tcp"
  from_port = 1
  to_port   = 65535

  cidr_blocks = ["${local.vpc_cidr_block}"]
}

resource "aws_security_group_rule" "egress" {
  type = "egress"

  security_group_id = "${aws_security_group.cluster.id}"

  protocol  = "-1"
  from_port = 0
  to_port   = 0

  cidr_blocks = ["0.0.0.0/0"]
}
