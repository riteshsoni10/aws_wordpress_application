output "security_group_id" {
        value = aws_security_group.db_security_group.id
}

output "public_ip"{
        value = aws_instance.db_server.public_ip
}
