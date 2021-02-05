/*
######## Data section ###########

resource "local_file" "data-test" {
  filename = "./pets.txt"
  content = data.local_file.sample.content
}


data "local_file" "sample" {
  filename = "./dogs.txt"
}
*/


######## import section ###########
provider "aws" {
    region = "us-east-1"
    profile = "testing"
}


resource "aws_instance" "webserver" {
  ami = "ami-03c5cc3d1425c6d34"
  instance_type = "t2.micro"
  user_data = <<-EOF
            #!/bin/bash
            sudo yum update -y
            sudo yum install nginx -y
            sudo systemctl enable nginx            
            sudo systemctl start nginx
            EOF
  tags = {
    "Name" = "TerraformEC2"
    "Env"  = "stage"
  }
}


output "instance-ids" {
    value = aws_instance.webserver.public_ip
}
#
/*
resource "aws_instance" "webnew" {
  ami = "ami-00eb20669e0990cb4"
  instance_type = "t2.micro"
  tags = {
    "Name" = "Sample"
    "Env"  = "stage"
  }
}
*/

## import ##
#terraform import aws_instance.web i-004aefd1b489bd4c6
#aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,Tags[?Key==`Name`].Value[0],State.Name,PrivateIpAddress,PublicIpAddress]' --output text

