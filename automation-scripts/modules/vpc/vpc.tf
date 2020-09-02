## Availability Zones
data "aws_availability_zones" "available" {
    state = "available"
}


## VPC Network
resource "aws_vpc" "web_server_vpc"{
    cidr_block           = var.vpc_cidr_block
    enable_dns_support   = var.dns_support_state
    enable_dns_hostnames = var.dns_hostnames_state
    tags                 = {
                Name     = "Application_Network"
    }
}


## Public Subnets
locals {
  public_cidr_block  = cidrsubnet(var.vpc_cidr_block, 8, 0)
  private_cidr_block = cidrsubnet(var.vpc_cidr_block, 8, 1)
}


resource "aws_subnet" "public_subnet"{
    count = "${length(data.aws_availability_zones.available.names)}"
    vpc_id = aws_vpc.web_server_vpc.id
    cidr_block = "${cidrsubnet(var.vpc_cidr_block, 8, count.index)}"
    availability_zones = "${element(data.aws_availability_zones.available.names,count.index)}"
    map_public_ip_on_launch = true

    tags        = {
            Name = "Public-${element(data.aws_availability_zones.available.names,count.index)}"
    }
    depends_on =[
        aws_vpc.web_server_vpc,
    ]
}