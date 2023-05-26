terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.51.0"
    }
  }
}

provider "aws" {
  # Configuration options 
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.region  
}

resource "aws_instance" "vm-web-server-1" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = var.name
  }
 
}


resource "aws_key_pair" "lab-deployer" {
  key_name   = var.key_name
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCl9+NBWh9t39mYDC1hozAPEyZ/hRKw6yu38iYWYCb3xWtpo732V85arBTM1mBi2/x9sXrx/ltx4zUhXxhOqJbgvSsGSYr6jVOzz9b7c54sdtrVvRTQGbEtZkDHp64nplEe6jjEhun1DFHL1d0tsz76zvsDfxCfPpYGrYX7diRw7V8EelfLzYfA9JoPHq09BpHE6f422fDRqG3nw2Ms9TrJmgHjgYhiwtiDMGaQoa4ntL24VjUOI+iJoybn7xJJQDB3GS0zCVmXe5dKBu4yPijPmwEZOr3hoL4TrS0lYaLkgP5lYUfgwc0iBbY6v2SRapF3fhcVU7sg8av3REj8iA4QK6ZMn6nCwckVUr0xgj541wEUclzQf/h+KiXL/ssehfnk43swDOwATDctAw3MJ69CWLgHJek48fkwyP7jADWLaka8y3xfnVmVBEJCZ+wAnXHdq3FQT8QXeXFbO21cvemU/J4qRvddmEp2LEIvA4dDoxrn9V48fhE8hYShmaVTXx8= ubuntu"
}