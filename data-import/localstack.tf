provider "aws" {
  profile                     = "default"
  access_key                  = "mock_access"
  secret_key                  = "mock_key"
  skip_credentials_validation = true
  s3_force_path_style         = true
  skip_metadata_api_check     = false
  skip_requesting_account_id  = true
  skip_region_validation      = true
  insecure                    = true
  region                      = "us-west-1"

  endpoints {
    apigateway     = "http://${var.localHostName}:4566"
    cloudformation = "http://${var.localHostName}:4566"
    cloudwatch     = "http://${var.localHostName}:4566"
    dynamodb       = "http://${var.localHostName}:4566"
    es             = "http://${var.localHostName}:4566"
    firehose       = "http://${var.localHostName}:4566"
    iam            = "http://${var.localHostName}:4566"
    kinesis        = "http://${var.localHostName}:4566"
    lambda         = "http://${var.localHostName}:4566"
    redshift       = "http://${var.localHostName}:4566"
    route53        = "http://${var.localHostName}:4566"
    s3             = "http://${var.localHostName}:4566"
    secretsmanager = "http://${var.localHostName}:4566"
    ses            = "http://${var.localHostName}:4566"
    sns            = "http://${var.localHostName}:4566"
    sqs            = "http://${var.localHostName}:4566"
    ssm            = "http://${var.localHostName}:4566"
    stepfunctions  = "http://${var.localHostName}:4566"
    sts            = "http://${var.localHostName}:4566"
    ec2            = "http://${var.localHostName}:4566"
  }
}

variable "localHostName" {
  default = "localhost"
}

# aws ec2 run-instances --image-id=ami-07dd19a7900a1f049 --count 1 --instance-type t2.micro  --endpoint-url=http://localhost:4566
# aws ec2 create-tags --resources <instance-id> --tags Key=Name,Value=CliInstance
# aws ec2 describe-instances --filters "Name=tag:Name,Values=CliInstance"