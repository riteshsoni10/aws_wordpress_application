variable "vpc_cidr_block" {
    type =  string
    description = "VPC CIDR Block"
}

variable "dns_support_state"{
    type = bool
    description = "Enable or disable DNS Enable in Network "
}

variable "dns_hostnames_state" {
    type = bool
    description = "Enable/Disable DNS Hostnames assign"
}
