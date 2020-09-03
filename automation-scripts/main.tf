provider "aws"{
    profile = var.user_profile
    region  = var.region_name
}

module "vpc" {
    source              = "./modules/vpc"
    vpc_cidr_block      = var.vpc_cidr_block
    dns_support_state   = var.vpc_dns_support_state
    dns_hostnames_state = var.vpc_dns_hostnames_state

}

module "web_server" {
    source           = "./modules/web_server"
    ami_id           = var.instance_ami
    vpc_id           = module.vpc.vpc_id
    instance_type    = var.instance_type
    key_name         = var.instance_key_name
    public_subnet_id = module.vpc.public_subnets.0
}


