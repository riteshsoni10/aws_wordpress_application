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

