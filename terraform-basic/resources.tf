resource "aws_instance" "lab-vm-1" {
	ami = "ami-04c5e6a8cd8b3ad24"
	instance_type = "t3.micro"
	tags = {
		Name = "lab-vm-1"
	}

    subnet_id =  aws_subnet.lab-vpc-subnet-1.id

}
resource "aws_instance" "lab-vm-2" {
	ami = "ami-04c5e6a8cd8b3ad24"
	instance_type = "t3.micro"
	tags = {
		Name = "lab-vm-2"
	}

    subnet_id =  aws_subnet.lab-vpc-subnet-2.id
}

resource "aws_instance" "lab-vm-sg" {
	ami = "ami-04c5e6a8cd8b3ad24"

	instance_type = "t3.micro"
	tags = {
		Name = "lab-vm-sg"
	}
						
	associate_public_ip_address = true
    subnet_id                   = aws_subnet.lab-vpc-subnet-2.id
    vpc_security_group_ids      = [aws_security_group.lab-security-group.id]
    key_name                    = aws_key_pair.lab-deployer.key_name

}


resource "aws_instance" "lab-vm-sg-with-variable" {
	ami = var.ami-id

	instance_type = var.instance-type
	tags = {
		Name = "lab-vm-sg"
	}
						
	associate_public_ip_address = true
    subnet_id                   = aws_subnet.lab-vpc-subnet-2.id
    vpc_security_group_ids      = [aws_security_group.lab-security-group.id]
    key_name                    = aws_key_pair.lab-deployer.key_name

}


resource "aws_key_pair" "lab-deployer" {
  key_name   = "lab-deployer2"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCl9+NBWh9t39mYDC1hozAPEyZ/hRKw6yu38iYWYCb3xWtpo732V85arBTM1mBi2/x9sXrx/ltx4zUhXxhOqJbgvSsGSYr6jVOzz9b7c54sdtrVvRTQGbEtZkDHp64nplEe6jjEhun1DFHL1d0tsz76zvsDfxCfPpYGrYX7diRw7V8EelfLzYfA9JoPHq09BpHE6f422fDRqG3nw2Ms9TrJmgHjgYhiwtiDMGaQoa4ntL24VjUOI+iJoybn7xJJQDB3GS0zCVmXe5dKBu4yPijPmwEZOr3hoL4TrS0lYaLkgP5lYUfgwc0iBbY6v2SRapF3fhcVU7sg8av3REj8iA4QK6ZMn6nCwckVUr0xgj541wEUclzQf/h+KiXL/ssehfnk43swDOwATDctAw3MJ69CWLgHJek48fkwyP7jADWLaka8y3xfnVmVBEJCZ+wAnXHdq3FQT8QXeXFbO21cvemU/J4qRvddmEp2LEIvA4dDoxrn9V48fhE8hYShmaVTXx8= ubuntu"
}