terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.80.0"
    }
  }
}

provider "aws" {
  profile = "${var.aws_profile}"
  region  = "us-east-1"
}