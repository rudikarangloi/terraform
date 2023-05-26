module "vpc-staging" {
  source = "../../../../module/aws/network"

  access_key = "AKIASDLPQMP6PQ2C7KO6"
  secret_key = "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"
  region = "ap-southeast-3"
  name = "vpc-staging"
  cidr_block = "172.0.0.0/16"
  cidr_block_subnet = "172.0.1.0/24"
}

output "vpc_id" {
  value = module.vpc-staging.vpc-id
}