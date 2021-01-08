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
            sudo systemctl enable nginx
            sudo systemctl start nginx
            EOF
  tags = {
    "Name" = "TestEnv"
  }
}


#### Local Exec #####
resource "aws_instance" "webserver1" {
  ami = "ami-07dd19a7900a1f049"
  instance_type = "t2.micro"
  tags = {
    "Name" = "TestEnv"
  }
  provisioner "local-exec" {
      command = "echo Ec2 Instance ${aws_instance.webserver.public_ip} created! > /tmp/instance_state.txt"  
  }
  provisioner "local-exec" {
      when = destroy
      command = "echo Ec2 Instance self.public_ip destroyed! > /tmp/instance_state.txt"  
  }
}

/*
##### Remote Exec ######
resource "aws_instance" "webserver" {
  ami = "ami-07dd19a7900a1f049"
  instance_type = "t2.micro"
  tags = {
    "Name" = "TestEnv"
  }
  provisioner "remote-exec" {
      inline = [
          "sudo apt update -y",
          "sudo apt install nginx -y",
          "sudo systemctl enable nginx",
          "sudo systemctl start nginx"
      ]
  }
  connection {
    type = ssh
    host = self.public_ip
    user = "ubuntu"
    private_key = file("/Users/nmuthu036/.ssh/web")
  }
  key_name = aws_key_pair.web.id
}
*/