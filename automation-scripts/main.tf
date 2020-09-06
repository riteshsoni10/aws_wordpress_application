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

module "ami_creation" {
    source           = "./modules/ami"
    ami_id           = var.web_server_instance_ami
    vpc_id           = module.vpc.vpc_id
    public_subnet_id = module.vpc.public_subnets.0

}


module "web_server" {
    source           = "./modules/web_server"
    ami_id           = var.web_server_instance_ami
    vpc_id           = module.vpc.vpc_id
    instance_type    = var.web_server_instance_type
    key_name         = var.instance_key_name
    public_subnet_id = module.vpc.public_subnets.0
}


module "database_server" {
    source            = "./modules/database_server"
    ami_id            = module.ami_creation.mysql_ami_id
    vpc_id            = module.vpc.vpc_id
    vpc_cidr_block    = var.vpc_cidr_block
    instance_type     = var.db_server_instance_type
    key_name          = module.web_server.key_name
    private_subnet_id = module.vpc.private_subnets.0
}


