
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
    region = "us-east-1"
    profile = "aws-test"
}


resource "aws_instance" "webserver" {
  ami = "ami-047a51fa27710816e"
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
  ami = "ami-0a36eb8fadc976275"
  instance_type = "t2.micro"
  tags = {
    "Name" = "Sample"
    "Env"  = "stage"
  }
}
*/

## import ##
#terraform import aws_instance.webnew i-944e00ef886a0c927
