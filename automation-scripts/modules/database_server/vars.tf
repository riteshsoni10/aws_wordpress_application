variable "ami_id" {
    type = string
    description = "AMI Id of Instance Image"
}

variable "vpc_id" {
    type = string
    description = "Web Server Network VPC ID"
}

variable "private_subnet_id" {
    type = string
    description = "Private Subnet Id for Web server Launch"
}

variable "key_name" {
    type = string
    description = "Instance SSH Key name"
}

variable "instance_type" {
    type = string
    description = "Database Server Configuration"
}
