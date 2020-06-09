variable "bucket_terraform_lab" {
  description = "The name of the S3 bucket. Must be globally unique."
  type        = string
  default     = "bucket-terraform-lab"
}

variable "dynamodb_terraform_lab_locks" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default     = "dynamodb_terraform_lab_locks"
}