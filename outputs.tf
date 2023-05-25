output "public-ip" {
  value = aws_instance.lab-vm-sg.public_ip
}