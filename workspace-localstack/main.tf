
# Create a random id
resource "random_id" "tf_bucket_id" {
  byte_length = 2
}

# Create the bucket
resource "aws_s3_bucket" "tf_code" {
  bucket = "${lookup(var.project_name, var.env)}-${random_id.tf_bucket_id.dec}"
  acl    = "private"

  force_destroy = true

  tags = {
    Name = "tf_bucket"
  }
}

# terraform workspace new dev 
# terraform workspace list
# terraform workspace select prod 
# terraform workspace delete 
# terraform workspace show

# aws s3 ls --endpoint-url=http://localhost:4566