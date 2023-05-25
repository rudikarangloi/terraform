terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.52.0"
    }
  }
}

provider "aws" {
  access_key = "AKIASDLPQMP6CSLWYLWO"
  secret_key = "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"
  # region = "ap-southeast-3"
  region = var.region

}


