resource "aws_security_group" "db_security_group" {
    name         = "allow_db_server_access"
    description  = "Database Server Access"
    vpc_id       = var.vpc_id

    ingress{
        description = "For MySQL Server Access"
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        cidr_blocks = [var.vpc_cidr_block]
    }

    ingress{
        description = "For SSH Access"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = [var.vpc_cidr_block]
    }

    egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

    tags = {
        Name = "database_security_group"
    }

}