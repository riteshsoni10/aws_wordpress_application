resource "aws_ami_from_instance" "mysql_ami_create" {
	name               = "mysql_ami"
	source_instance_id = aws_instance.mysql_ami.id
	snapshot_without_reboot = true

	lifecycle {
        	prevent_destroy = true
	}

	depends_on = [
		null_resource.mysql_configuration
	]
}
