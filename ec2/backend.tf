terraform {
  required_version = "~>0.11.7"

  backend "s3" {
    region  = "eu-central-1"
    bucket  = "terraform-demo-tfstate"
    key     = "demo/ec2.tfstate"
    profile = "606609185801"
  }
}
