output "vpc_id"{
    value = module.vpc.vpc_id
}

output "public_subnet_ids"{
    value = module.vpc.public_subnets
}

output "public_subnet_cidrs"{
    value = module.vpc.public_cidr
}

output "private_subnet_ids" {
    value = module.vpc.private_subnets
}

output "private_subnet_cidrs"{
    value = module.vpc.private_cidr
}

output "web_server_public_ip" {
    value = module.web_server.public_ip
}

output "web_server_security_group_id" {
    value = module.web_server.security_group_id
}

output "database_server_private_ip" {
    value = module.database_server.private_ip
}

output "database_server_security_group_id" {
    value = module.database_server.security_group_id
}