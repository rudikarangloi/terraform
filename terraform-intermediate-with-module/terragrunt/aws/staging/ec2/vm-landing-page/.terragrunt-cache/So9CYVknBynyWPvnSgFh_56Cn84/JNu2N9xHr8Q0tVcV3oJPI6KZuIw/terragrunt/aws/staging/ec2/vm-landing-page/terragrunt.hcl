terraform {
    source = "../../../../..///module/aws/ec2"
}

include {
    path = find_in_parent_folders()
}

inputs = {
    instance_type = "t3.micro"
}