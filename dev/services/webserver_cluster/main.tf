provider "aws" {
  region = "us-east-2"
}


module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"
  
  cluster_name           = "webservers-cluster-${local.env}"
  db_remote_state_bucket = "bucket-terraform-lab"
  db_remote_state_key    = "${local.env}/database/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 2
}

locals {
  env = "dev"
  http_port    = 80
  any_port     = 0
  any_protocol = "-1"
  tcp_protocol = "tcp"
  all_ips      = ["0.0.0.0/0"]
}

