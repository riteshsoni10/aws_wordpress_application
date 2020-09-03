## Web Server Instance
resource "aws_instance" "web_server" {
    ami                         = var.ami_id
    instance_type               = var.instance_type
    subnet_id                   = var.public_subnet_id
    vpc_security_group_ids      = [aws_security_group.web_server_security_group.id]
    key_name                    = aws_key_pair.create_instance_key_pair.key_name
    associate_public_ip_address = true
    tags                        = {
                        Name = "Web-Server"
    }

    depends_on  = [
        aws_security_group.web_server_security_group,
        aws_key_pair.create_instance_key_pair,
    ]
}

