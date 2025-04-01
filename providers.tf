terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.80.0"
    }
  }
  backend "s3" {
    bucket  = "terraform-state-salmomascarenhas"
    region  = "us-east-1"
    key     = "terraform.tfstate"
    encrypt = true
  }

}

provider "aws" {
  profile = "salmomascarenhas-pessoal-sso"
  region  = "us-east-1"
}

resource "aws_s3_bucket" "teraform_state" {
  bucket = var.bucket_state
  acl    = "private"
  tags = {
    Name        = "terraform-state"
    Environment = "dev"
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.teraform_state.bucket
  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [aws_s3_bucket.teraform_state]
}