## Mysql AMI Instance
resource "aws_instance" "mysql_ami" {
    ami                         = var.ami_id
    instance_type               = var.instance_type
    subnet_id                   = var.public_subnet_id
    vpc_security_group_ids      = [aws_security_group.ami_security_group.id]
    key_name                    = aws_key_pair.ami_key_pair.key_name
    associate_public_ip_address = true
    tags                        = {
                        Name = "DB-AMI"
    }

    depends_on  = [
        aws_security_group.ami_security_group,
        aws_key_pair.ami_key_pair,
    ]
}

/*
## Wordpress Instance
resource "aws_instance" "wordpress-ami" {
    ami                         = var.ami_id
    instance_type               = var.instance_type
    subnet_id                   = var.public_subnet_id
    vpc_security_group_ids      = [aws_security_group.ami_security_group.id]
    key_name                    = aws_key_pair.ami_key_pair.key_name
    associate_public_ip_address = true
    tags                        = {
                        Name = "Wordpress-ami"
    }

    depends_on  = [
        aws_security_group.ami_security_group,
        aws_key_pair.ami_key_pair,
    ]
}
*/
