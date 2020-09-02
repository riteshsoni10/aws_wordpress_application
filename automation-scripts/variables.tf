variable "region_name" {
    type = string
    description = "Region Name of Launched Resources"
}

variable "user_profile" {
    type = string
    description = "IAM Profile Name"
}

variable "vpc_cidr_block" {
    type =  string
    description = "VPC CIDR Block"
}

variable "vpc_dns_support_state"{
    type = bool
    description = "Enable or disable DNS Enable in Network "
}

variable "vpc_dns_hostnames_state" {
    type = bool
    description = "Enable/Disable DNS Hostnames assign"
}