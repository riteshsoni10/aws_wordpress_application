## Internet Gateway
resource "aws_internet_gateway" "web_server_igw" {
    vpc_id = aws_vpc.web_server_vpc.id
    tags = {
        Name = "Web-IGW"
    }
    depends_on = [
        aws_vpc.web_server_vpc
    ]
}

## Public Route Table
resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.web_server_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.web_server_igw.id
    }
    
    tags = {
        Name = "public_route_table"
    }

    depends_on = [
        aws_internet_gateway.web_server_igw,
        aws_vpc.web_server_vpc,
    ]
}


resource "aws_route_table_association" "public_route_table_association" {
    count          = "${length(data.aws_availability_zones.available.names)}" 
    subnet_id      = "${element(aws_subnet.public_subnet.*.id,count.index)}"
    route_table_id = aws_route_table.public_route_table.id

    depends_on = [
        aws_route_table.public_route_table
    ]
}
