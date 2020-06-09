#provider "aws" {
#  region = "us-east-2"
#}

resource "aws_db_instance" "mysql" {
  identifier_prefix   = "terraform-lab"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = var.db_instance
  name                = var.db_name
  username            = "admin"
  password            = data.aws_kms_secrets.rds-secret.plaintext["master_password"]
  skip_final_snapshot = true
}

data "aws_kms_secrets" "rds-secret" {
  secret {
    name = "master_password"
    payload = "AQICAHi1Rjtt3R8vhtG6rHLzP0xP3ikNwviah90CCp4d35vIdQH3uwC1KOdhR1PH/ERjW1HTAAAAaDBmBgkqhkiG9w0BBwagWTBXAgEAMFIGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMy2PlWMxf9hqIyw/oAgEQgCVLArVLoKlYVCuZcLN6KWA/1ALvoYSauEW8n8kxNEWzmHnPI71w"
  }
}

terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "bucket-terraform-lab"
    key            = "prod/database/mysql/terraform.tfstate"
    region         = "us-east-2"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "dynamodb_terraform_lab_locks"
    encrypt        = true
  }
}
