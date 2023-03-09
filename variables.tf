# Variable Declaration for Region Name
variable region_name {
    type = string
    default = "ap-south-1"
}

# Variable Declaration for Subnet CIDR
variable subnet_cidrs {
    type = list(string)
    default = ["10.0.1.0/24","10.0.2.0/24"]
}

# Variable Declaration for Subnet Availability_Zone
variable availability_zones {
    type = list(string)
    default = ["ap-south-1a","ap-south-1b"]
}

# Variable Declaration for AMI_ID
variable ami_id {
    type = string
    default = "ami-09ba48996007c8b50"
}

# Variable Declaration for Instance type
variable instance_type {
    type = string
    default = "t2.micro"
}
