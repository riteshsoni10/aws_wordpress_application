resource "null_resource" "mysql_configuration" {
	connection {
		type = var.connection_type
		host = aws_instance.mysql_ami.public_ip
		user = var.connection_user
		private_key = file(var.key_name)
	}

	provisioner "remote-exec" {
		inline = [
			"ansible-playbook -l ${aws_instance.mysql_ami.public_ip}playooks/mysql.yml -u ${var.connection_user} --private-key ${var.key_name} --ssh-extra-args='-o stricthostkeychecking=no'"
		]
	}


	depends_on =[
		aws_instance.mysql_ami
	]
}

