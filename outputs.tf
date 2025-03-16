output "aws_s3_bucket_domain_name" {
    value = data.aws_s3_bucket.bucket.bucket_domain_name
    sensitive = false
    description = "The bucket domain name"
}

output "bucket_region" {
    value = data.aws_s3_bucket.bucket.region
    sensitive = false
    description = "The bucket region"
}