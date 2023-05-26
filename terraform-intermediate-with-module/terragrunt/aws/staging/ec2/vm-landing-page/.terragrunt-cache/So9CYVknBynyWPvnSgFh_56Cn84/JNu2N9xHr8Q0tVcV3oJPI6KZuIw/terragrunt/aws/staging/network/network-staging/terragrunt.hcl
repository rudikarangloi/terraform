terraform {
    source = "../../../../..//module/aws/network"
}

include {
    path = find_in_parent_folders()
}

inputs = {
    cidr_block = "172.0.0.0/16"
    cidr_block_subnet = "172.0.1.0/24"
}