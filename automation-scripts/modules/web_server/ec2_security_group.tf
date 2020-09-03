resource "aws_security_group" "web_server_security_group" {
    name         = "allow_http_ssh"
    description  = "Application Access"
    vpc_id       = var.vpc_id

    ingress{
        description = "For Web Server Access"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress{
        description = "For SSH Access"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

    tags = {
        Name = "application_security_group"
    }

}