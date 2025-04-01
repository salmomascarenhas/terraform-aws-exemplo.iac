variable "bucket_state" {
  description = "Nome do bucket S3 para o estado do Terraform"
  type        = string
  default     = "terraform-state-salmomascarenhas"
}