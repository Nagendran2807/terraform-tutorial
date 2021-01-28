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

# endpoints {
#   sqs = "http://${var.localHostName}:4566"
# }

endpoints {
  sqs = "http://${var.localHostName}:4576"
}

}
#   endpoints {
#     apigateway     = "http://${var.localHostName}:4567"
#     cloudformation = "http://${var.localHostName}:4581"
#     cloudwatch     = "http://${var.localHostName}:4582"
#     dynamodb       = "http://${var.localHostName}:4569"
#     es             = "http://${var.localHostName}:4578"
#     firehose       = "http://${var.localHostName}:4573"
#     iam            = "http://${var.localHostName}:4593"
#     kinesis        = "http://${var.localHostName}:4568"
#     lambda         = "http://${var.localHostName}:4574"
#     redshift       = "http://${var.localHostName}:4577"
#     route53        = "http://${var.localHostName}:4580"
#     s3             = "http://${var.localHostName}:4572"
#     secretsmanager = "http://${var.localHostName}:4584"
#     ses            = "http://${var.localHostName}:4579"
#     sns            = "http://${var.localHostName}:4575"
#     sqs            = "http://${var.localHostName}:4576"
#     ssm            = "http://${var.localHostName}:4583"
#     stepfunctions  = "http://${var.localHostName}:4585"
#     sts            = "http://${var.localHostName}:4592"
#   }
# }

variable "localHostName" {
  default = "localhost"
}