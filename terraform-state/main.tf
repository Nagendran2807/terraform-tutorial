### provision ec2 instance

provider "aws" {
  region = "us-east-1"
  profile = "aws-test"
}

/*
resource "aws_instance" "server-prod" {
  ami           = "ami-07ebfd5b3428b6f4d"
  instance_type = "t2.nano"
  count         = (var.instances == "ec2" && var.environment == "prod") ? 1 : 0
  tags = {
    Name = "Server 1" #${count.index}
  }
}

resource "aws_instance" "server" {
  ami           = "ami-07ebfd5b3428b6f4d"
  instance_type = "t2.nano"
  count         = (var.instances == "ec2" && var.environment != "prod") ? 1 : 0
  tags = {
    Name = "Server 2" #${count.index}
  }
}


# var
variable "environment" {
  description = "No of ec2 instances going to create"
  default     = "prod"
}

variable "instances" {
  description = "ec2 instances"
  default = "ec2"
}

output "instance-ip-address" {
  value = {
    for instance in aws_instance.server :
    instance.id => instance.private_ip
  }
}


data "aws_availability_zones" "all" {
  all_availability_zones = true
}

*/
variable "env_suffix" {
  description = "the suffix to apply to all the objects to specify an environment if multiple instances need to live in the same AWS account"
  default     = "test"
}

