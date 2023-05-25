variable "region" {
  type = string
}
variable "ami-id" {
  type = string
  default = "ami-04c5e6a8cd8b3ad24"
}
variable "instance-type" {
  type = string
  default = "t3.micro"
}