variable "region" {}

variable "ecs_cluster_name" {}
variable "ecs_cluster_key_name" {}

variable "ecs_cluster_ami_id" {
  default = ""
}

variable "ecs_cluster_instance_type" {
  default = "t2.micro"
}

variable "ecs_cluster_desired_capacity" {
  default = 3
}

variable "ecs_cluster_min_size" {
  default = 2
}

variable "ecs_cluster_max_size" {
  default = 5
}
