output "tfstate" {
  value = "${aws_s3_bucket.tfstate.bucket}"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "vpc_cidr_block" {
  value = "${module.vpc.vpc_cidr_block}"
}

output "subnet_ids" {
  value = "${join(",", module.vpc.private_subnets)}"
}

output "private_subnet_ids" {
  value = "${join(",", module.vpc.private_subnets)}"
}

output "public_subnet_ids" {
  value = "${join(",", module.vpc.public_subnets)}"
}
