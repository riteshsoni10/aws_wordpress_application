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