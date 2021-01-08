provider "aws" {
    region = "us-west-2"
    profile = "testing"
}


/*
resource "aws_instance" "webserver" {
  ami = "ami-07dd19a7900a1f049"
  instance_type = "t2.micro"
  user_data = <<-EOF
            #!/bin/bash
            sudo apt update -y
            sudo apt install nginx -y
            sudo systemctl enable nginx
            sudo systemctl start nginx
            EOF
  tags = {
    "Name" = "TestEnv"
  }
}


output "instance-ids" {
    value = aws_instance.webserver.public_ip
}

*/


/*
data "aws_instance" "webserver-test" {
  instance_id = ""
}



## import ##
terraform import aws_instance.web i-12345678
  
