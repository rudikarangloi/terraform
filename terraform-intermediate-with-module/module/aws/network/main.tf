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

#Create vpc
resource "aws_vpc" "lab-vpc" {
  cidr_block       = var.cidr_block

  tags = {
    Name = var.name
  }
}

#Create subnet
resource "aws_subnet" "lab-vpc-subnet-1" {
	vpc_id     = aws_vpc.lab-vpc.id
	cidr_block = var.cidr_block_subnet

	tags = {
		Name = "subnet-${var.name}-1"
	}
}
				
resource "aws_subnet" "lab-vpc-subnet-2" {
    vpc_id     = aws_vpc.lab-vpc.id
    cidr_block = var.cidr_block_subnet

    tags = {
	    Name = "subnet-${var.name}-2"
    }
}

#Create Internet Gateway
resource "aws_internet_gateway" "lab-igw" {
  vpc_id = aws_vpc.lab-vpc.id

  tags = {
	  Name = "lab-igw-${var.name}"
  }
}

#Create Route table
resource "aws_route_table" "lab-rt" {
  vpc_id = aws_vpc.lab-vpc.id

  route {
	  cidr_block = "0.0.0.0/0"
	  gateway_id = aws_internet_gateway.lab-igw.id
  }
				  
  tags = {
    Name = "lab-rt-${var.name}"
  }
}

#Route table assosiation
resource "aws_route_table_association" "lab-rt-subnet-1" {
  subnet_id      = aws_subnet.lab-vpc-subnet-1.id
  route_table_id = aws_route_table.lab-rt.id
}
resource "aws_route_table_association" "lab-rt-subnet-2" {
  subnet_id      = aws_subnet.lab-vpc-subnet-2.id
  route_table_id = aws_route_table.lab-rt.id
}