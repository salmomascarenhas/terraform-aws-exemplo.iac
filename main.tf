module "s3" {
  source         = "./modules/s3"
  s3_bucket_name = "bucket-s3-iac"
  s3_tags = {
    Iac  = true
    Name = "Bucket S3"
  }
}

module "cloudfront" {
  source             = "./modules/cloudfront"
  origin_id          = module.s3.bucket_id
  bucket_domain_name = module.s3.bucket_domain_name
  depends_on         = [module.s3]
  cdn_tags = {
    Iac  = true
    Name = "CDN"
  }
}

module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"

  name = "sqs-iac"

  create_dlq = true
  redrive_policy = {
    # default is 5 for this module
    maxReceiveCount = 10
  }

  tags = {
    Iac  = true
    Name = "SQS"
  }
}