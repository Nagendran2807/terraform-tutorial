
######## Data section ###########
/*
resource "local_file" "data-test" {
  filename = "./pets.txt"
  content = data.local_file.sample.content
}

/*
data "local_file" "sample" {
  filename = "./dogs.txt"
}
*/


######## import section ###########
provider "aws" {
    region = "us-west-2"
    profile = "testing"
}


resource "aws_instance" "webserver" {
  ami = "ami-07dd19a7900a1f049"
  instance_type = "t2.micro"
  user_data = <<-EOF
            #!/bin/bash
            sudo apt update -y
            sudo apt install nginx -y
            
            sudo systemctl start nginx
            EOF
  tags = {
    "Name" = "TestMachine"
    "Env"  = "stage"
  }
}


output "instance-ids" {
    value = aws_instance.webserver.public_ip
}
#

resource "aws_instance" "webnew" {
  ami = "ami-0a36eb8fadc976275"
  instance_type = "t2.micro"
  tags = {
    "Name" = "Sample"
    "Env"  = "stage"
  }
}



## import ##
#terraform import aws_instance.web i-004aefd1b489bd4c6
