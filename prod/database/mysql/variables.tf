variable "db_instance" {
  description = "instance class for mysql db"
  type        = string
  default     = "db.t2.micro"
}

variable "db_name" {
  description = "The name to use for the database"
  type        = string
  default     = "terraform_lab_database_prod"
}

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