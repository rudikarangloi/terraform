module "vm-web-server-1" {
  source = "../../../../module/aws/ec2"

  access_key = "AKIASDLPQMP6JDON7PBT"
  secret_key = "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"
  region = "ap-southeast-3"
  name = "vm-web-server-1"
  ami = "ami-0dea4c77aa6baff5a"
  instance_type = "t3.micro"
  key_name = "lab-deployer"
  vpc_security_group_ids = ["sg-075d3a70d7ba1fb36"]
  
}

output "public_ip" {
  value = module.vm-web-server-1.public_ip
}