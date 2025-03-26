variable "origin_id" {
    type = string
    default = ""
    description = "ID do bucket S3"
}

variable "bucket_domain_name" {
    type = string
    default = ""
    description = "Nome de domínio do bucket S3"
}

variable "cdn_price_classe" {
    type = string
    default = "PriceClass_200"
    description = "Classe de preço do CloudFront"
}

variable "cdn_tags" {
    type = map(string)
    default = {}
    description = "Tags do CloudFront"
}