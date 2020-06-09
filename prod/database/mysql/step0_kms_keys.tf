provider "aws" {
  region = "us-east-2"
}

resource "aws_kms_key" "rds-key" {
  description = "key to encrypt rds password"
  deletion_window_in_days = 7

}

resource "aws_kms_alias" "rds-kms-alias" {
  target_key_id = "${aws_kms_key.rds-key.id}"
  name = "alias/rds-kms-key"
}

#resource "aws_iam_role" "a" {
#  name = "iam-role-for-grant"
#
#  assume_role_policy = <<EOF
#{
#  "Version": "2012-10-17",
#  "Statement": [
#    {
#      "Action": "sts:AssumeRole",
#      "Principal": {
#        "Service": "kms.amazonaws.com"
#      },
#      "Effect": "Allow",
#      "Sid": ""
#    }
#  ]
#}
#EOF
#}
#
#resource "aws_kms_grant" "a" {
#  name              = "my-grant"
#  key_id            = "${aws_kms_key.a.key_id}"
#  grantee_principal = "${aws_iam_role.a.arn}"
#  operations        = ["Encrypt", "Decrypt", "GenerateDataKey"]
#
#  constraints {
#    encryption_context_equals = {
#      Department = "Finance"
#    }
#  }
#}