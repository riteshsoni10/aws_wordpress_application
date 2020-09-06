output "vpc_id"{
    value = aws_vpc.web_server_vpc.id
}

output "public_subnets"{
    value          = aws_subnet.public_subnet.*.id
}

output "public_cidr"{
    value = aws_subnet.public_subnet.*.cidr_block
}

output "private_subnets" {
    value          = aws_subnet.private_subnet.*.id
}


output "private_cidr"{
    value = aws_subnet.private_subnet.*.cidr_block
}
