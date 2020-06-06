variable "db_instance" {
  description = "instance class for mysql db"
  type        = string
  default     = "db.t2.micro"
}

variable "bucket_terraform_lab_03" {
  description = "The name of the S3 bucket. Must be globally unique."
  type        = string
  default     = "bucket-terraform-lab-03"
}

variable "dynamodb_terraform_lab_locks" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default     = "dynamodb_terraform_lab_locks"
}