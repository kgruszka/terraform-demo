resource "null_resource" "iam_wait" {
  depends_on = [
    "aws_iam_instance_profile.cluster",
    "aws_iam_role.cluster_instance_role",
    "aws_iam_policy.cluster_instance_policy",
    "aws_iam_policy_attachment.cluster_instance_policy_attachment",
    "aws_iam_role.cluster_service_role",
    "aws_iam_policy.cluster_service_policy",
    "aws_iam_policy_attachment.cluster_service_policy_attachment",
  ]
}

resource "aws_iam_instance_profile" "cluster" {
  name = "ecs-${var.cluster_name}-InstanceProfile"
  path = "/"
  role = "${aws_iam_role.cluster_instance_role.name}"
}

resource "aws_iam_role" "cluster_instance_role" {
  name               = "ecs-${var.cluster_name}-InstanceRole"
  description        = "ecs cluster ${var.cluster_name} Instance Role"
  assume_role_policy = "${file("${path.module}/policies/ecs-instance-role.json")}"
}

resource "aws_iam_policy" "cluster_instance_policy" {
  name        = "ecs-${var.cluster_name}-InstanceRolePolicy"
  description = "ecs-${var.cluster_name}-InstanceRole Policy"
  policy      = "${file("${path.module}/policies/ecs-instance-policy.json")}"
}

resource "aws_iam_policy_attachment" "cluster_instance_policy_attachment" {
  name       = "ecs-${var.cluster_name}-InstanceRole-policy-attachment"
  roles      = ["${aws_iam_role.cluster_instance_role.id}"]
  policy_arn = "${aws_iam_policy.cluster_instance_policy.arn}"
}

resource "aws_iam_role" "cluster_service_role" {
  name               = "ecs-${var.cluster_name}-ServiceRole"
  description        = "ecs cluster ${var.cluster_name} Service Role"
  assume_role_policy = "${file("${path.module}/policies/ecs-service-role.json")}"
}

resource "aws_iam_policy" "cluster_service_policy" {
  name        = "ecs-${var.cluster_name}-ServiceRolePolicy"
  description = "ecs-${var.cluster_name}-ServiceRole Policy"
  policy      = "${file("${path.module}/policies/ecs-service-policy.json")}"
}

resource "aws_iam_policy_attachment" "cluster_service_policy_attachment" {
  name       = "ecs-${var.cluster_name}-ServiceRole-policy-attachment"
  roles      = ["${aws_iam_role.cluster_service_role.id}"]
  policy_arn = "${aws_iam_policy.cluster_service_policy.arn}"
}
