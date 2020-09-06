## Generating SSH-Key pair
resource "tls_private_key" "ami_key"{
    algorithm = "RSA"
}

## Creating AWS Instance Key-Pair using SSH-Key generated
resource "aws_key_pair" "ami_key_pair" {
    key_name   = var.key_name
    public_key = tls_private_key.ami_key.public_key_openssh

    depends_on = [
        tls_private_key.ami_key
    ]
}

## Saving Private Key for SSH Login in pem Format
resource "local_file" "store_ami_key"{
    content = tls_private_key.ami_key.private_key_pem
    filename = var.key_name
    file_permission = "0400"
    depends_on = [
        tls_private_key.ami_key
    ]
}
