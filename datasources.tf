data "aws_s3_bucket" "bucket" {
    bucket = "${var.bucket_main}-${terraform.workspace}"
}