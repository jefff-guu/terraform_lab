provider "aws" {
  region = "us-east-2"
}


module "webserver_cluster" {
  source = "../../../modules/services/webserver_cluster"
  
  cluster_name           = "webservers-cluster-${var.env}"
  db_remote_state_bucket = "bucket-terraform-lab"
  db_remote_state_key    = "${var.env}/database/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 2
}

resource "aws_security_group_rule" "allow_testing_inbound" {
  type              = "ingress"
  security_group_id = module.webserver_cluster.alb_security_group_id

  from_port   = 12345
  to_port     = 12345
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "bucket-terraform-lab"
    key            = "dev/services/webserver_cluster/terraform.tfstate"
    region         = "us-east-2"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "dynamodb_terraform_lab_locks"
    encrypt        = true
  }
}

