provider "aws"{
    profile = var.user_profile
    region  = var.region_name
}

module "web_server" {
    source              = "./modules/web_server"
    vpc_cidr_block      = var.vpc_cidr_block
    dns_support_state   = var.vpc_dns_support_state
    dns_hostnames_state = var.vpc_dns_hostnames_state

}