resource "aws_launch_configuration" "demo" {
  name_prefix          = "${var.cluster_name}-"
  image_id             = "${local.cluster_ami_id}"
  instance_type        = "${var.cluster_instance_type}"
  key_name             = "${local.cluster_key_name}"
  iam_instance_profile = "${aws_iam_instance_profile.cluster.name}"
  user_data            = "${data.template_file.ecs_user_data.rendered}"

  security_groups = [
    "${aws_security_group.cluster.id}",
  ]

  associate_public_ip_address = false

  depends_on = [
    "null_resource.iam_wait",
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "demo" {
  name = "asg-${var.cluster_name}"

  vpc_zone_identifier = [
    "${local.subnet_ids}",
  ]

  launch_configuration = "${aws_launch_configuration.demo.name}"

  min_size         = "${var.cluster_min_size}"
  max_size         = "${var.cluster_max_size}"
  desired_capacity = "${var.cluster_desired_capacity}"

  tags = [
    {
      key                 = "Name"
      value               = "${var.cluster_name} instance"
      propagate_at_launch = true
    },
  ]
}

resource "aws_ecs_cluster" "demo" {
  name = "${var.cluster_name}"
}