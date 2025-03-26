# Caso o recurso não exista, o terraform irá retornar um erro.
data "aws_s3_bucket" "s3_bucket" {
    bucket = "${var.s3_bucket_name}-${terraform.workspace}"
}
