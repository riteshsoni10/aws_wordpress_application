variable "ami_id" {
    type = string
    description = "AMI Id of Instance Image"
}

variable "vpc_id" {
    type = string
    description = "Web Server Network VPC ID"
}

variable "public_subnet_id" {
    type = string
    description = "Public Subnet Id for Web server Launch"
}

variable "key_name" {
    type = string
    description = "Instance SSH Key name"
    default = "temp-key"
}

variable "instance_type" {
    type = string
    description = "Temporary Server Configuration"
    default    = "t2.micro"
}


variable "connection_user" {
    type = string
    description = "The login user for SSH connection"
    default     = "ec2-user"
}

