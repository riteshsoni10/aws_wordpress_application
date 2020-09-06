resource "null_resource" "mysql_configuration" {

	provisioner "local-exec" {
		command = "ansible-playbook -l ${aws_instance.mysql_ami.public_ip} playbooks/mysql.yml -u ${var.connection_user} --private-key ${var.key_name} --ssh-extra-args='-o stricthostkeychecking=no'"
	}


	depends_on =[
		aws_instance.mysql_ami
	]
}

