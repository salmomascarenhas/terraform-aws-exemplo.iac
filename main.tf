resource "aws_s3_bucket" "se_bucket" {
    bucket = "${var.bucket_main}-${terraform.workspace}"

    tags = {
        Name = "bucket-estudos-iac-${terraform.workspace}"
        Iac = true
        Environment = "${terraform.workspace}"
    }

}