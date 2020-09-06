output "mysql_ami_id" {
	value = aws_ami_from_instance.mysql_ami_create.id
}
