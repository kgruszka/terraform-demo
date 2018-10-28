resource "aws_s3_bucket" "tfstate" {
  bucket = "${var.s3_bucket_tfstate_name}"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags {
    Name        = "${var.s3_bucket_tfstate_name}"
    Environment = "Demo"
  }
}
