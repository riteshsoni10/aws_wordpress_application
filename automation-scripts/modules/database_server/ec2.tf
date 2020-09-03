## Web Server Instance
resource "aws_instance" "db_server" {
    ami                         = var.ami_id
    instance_type               = var.instance_type
    subnet_id                   = var.private_subnet_id
    vpc_security_group_ids      = [aws_security_group.db_security_group.id]
    key_name                    = var.key_name
    tags                        = {
                        Name = "Database-Server"
    }

    depends_on  = [
        aws_security_group.db_security_group,
    ]
}

