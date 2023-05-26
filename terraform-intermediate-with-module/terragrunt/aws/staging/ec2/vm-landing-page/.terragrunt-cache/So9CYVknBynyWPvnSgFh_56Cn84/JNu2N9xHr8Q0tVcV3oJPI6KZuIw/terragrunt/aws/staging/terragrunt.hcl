inputs = {
    region = "ap-southeast-3"
    access_key = "AKIASDLPQMP6JDON7PBT"
    secret_key = "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"
    name = "${basename(get_terragrunt_dir())}"
    ami = "ami-04c5e6a8cd8b3ad24"   
    key_name = "Key-pair-1"
    vpc_security_group_ids = ["sg-075d3a70d7ba1fb36"] 
}