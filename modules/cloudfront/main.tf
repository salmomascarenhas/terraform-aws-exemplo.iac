resource "aws_cloudfront_distribution" "cloudfront" {
    enabled = true

    origin {
        domain_name = var.bucket_domain_name
        origin_id = var.origin_id
        custom_origin_config {
            http_port = 80
            https_port = 443
            origin_protocol_policy = "http-only"
            origin_ssl_protocols = ["TLSv1"]
        }
    }
    default_root_object = "index.html"
    default_cache_behavior {
        target_origin_id = var.origin_id
        viewer_protocol_policy = "redirect-to-https"
        allowed_methods = ["GET", "HEAD", "OPTIONS"]
        cached_methods = ["GET", "HEAD", "OPTIONS"]
        forwarded_values {
            query_string = false
            cookies {
                forward = "none"
            }
        }
        min_ttl = 0
        default_ttl = 3600
        max_ttl = 86400
    }
    restrictions {
        geo_restriction {
            restriction_type = "none"
        }
    }
    viewer_certificate {
        cloudfront_default_certificate = true
    }
    price_class = var.cdn_price_classe
    tags = "${var.cdn_tags}"
}
