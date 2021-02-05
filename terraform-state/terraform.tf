/*
terraform {
  backend "s3" {
    encrypt = true
    bucket = "terraform-state-s3-remote"
    region = "us-east-1"
    key = "terraform-state-files/terraform.tfstate"
    dynamodb_table = "terraform-state-lock-dynamodb-new"
    profile = "aws-test"
  }
}

*/