resource "aws_vpc" "web_server_vpc"{
    cidr_block           = var.vpc_cidr_block
    enable_dns_support   = var.dns_support_state
    enable_dns_hostnames = var.dns_hostnames_state
    tags                 = {
                Name     = "Application_Network"
    }
}