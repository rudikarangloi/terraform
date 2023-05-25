inputs = {
    region = "ap-southeast-3"
    access_key = "AKIASDLPQMP6PQ2C7KO6"
    secret_key = "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"    
    name = "${basename(get_terragrunt_dir())}"
    ami = "ami-04c5e6a8cd8b3ad24"   
    key_name = "lab-deployer"
    vpc_security_group_ids = ["sg-075d3a70d7ba1fb36"] 
}