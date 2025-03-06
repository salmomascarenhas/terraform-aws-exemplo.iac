resource "aws_s3_bucket" "se_bucket" {
    bucket = "bucket-estudos-iac-${terraform.workspace}"

    tags = {
        Name = "bucket-estudos-iac-${terraform.workspace}"
        Iac = true
        Environment = "${terraform.workspace}"
    }

}