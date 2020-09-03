output "security_group_id" {
        value = aws_security_group.web_server_security_group.id
}

output "public_ip"{
        value = aws_instance.web_server.public_ip
}