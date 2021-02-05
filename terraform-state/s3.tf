
######## Terraform state file backup ###########
resource "aws_s3_bucket" "terraform-state-s3" {
  bucket = "terraform-state-s3-remote"
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = true
  }
  tags = {
    "env" = var.env_suffix
    "name" = "S3 Remote Terraform state store"
  }
}

############ Dynamo DB table for state file lock ########
resource "aws_dynamodb_table" "terraform-state-lock-dynamodb" {
  name = "terraform-state-lock-dynamodb-new"
  hash_key = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "name" = "Dynamo db for teraform state lock"
    "env" = var.env_suffix
  }
}
