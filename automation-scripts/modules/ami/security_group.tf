resource "aws_security_group" "ami_security_group" {
    name         = "allow_ssh"
    description  = "Remote Access"
    vpc_id       = var.vpc_id

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
}