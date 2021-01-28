terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.22.0"
    }
  }
}

provider "aws" {
    region = "us-west-2"
    profile = "testing"
}

module "vpc" {
  source = "./vpc"
  name = "test-vpc"
  cidr = "10.0.0.0/16"
  azs = ["us-west-2a", "us-west-2b"]  
  public_subnets = ["10.0.10.0/24", "10.0.20.0/24"]
  private_subnets = ["10.0.30.0/24", "10.0.40.0/24"]
  tags = {
      terraform = "true"
      env = "dev"
  }
}

