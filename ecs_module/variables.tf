variable "cluster_name" {}
variable "cluster_key_name" {}

variable "cluster_ami_id" {
  default = ""
}

variable "cluster_instance_type" {
  default = "t2.micro"
}

variable "cluster_desired_capacity" {
  default = 3
}

variable "cluster_min_size" {
  default = 2
}

variable "cluster_max_size" {
  default = 5
}
