#create internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main.id}"

}

#create route tables for public subnets (subnet can reach everywhere cidr_block = "0.0.0.0/0" thisgateway_id igw for rt to reach internet/ )
resource "aws_route_table" "public_rt" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
}
#Associate the Route Table with the public subnets
resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.public1.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
}

resource "aws_route_table_association" "b" {
  subnet_id      = "${aws_subnet.public2.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
}

resource "aws_route_table_association" "c" {
  subnet_id      = "${aws_subnet.public3.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
} 

#create Nat Gateway
resource "aws_eip" "nat" {
vpc  = true
}
resource "aws_nat_gateway" "ngw" {
allocation_id = "${aws_eip.nat.id}"
subnet_id     = "${aws_subnet.public1.id}"

}

#create route tables for private subnets
resource "aws_route_table" "private_rt" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"    
    gateway_id = "${aws_nat_gateway.ngw.id}"
  }
}
#Associate the Route Table with the Subnet
resource "aws_route_table_association" "d" {
  subnet_id      = "${aws_subnet.private1.id}"
  route_table_id = "${aws_route_table.private_rt.id}"
}

resource "aws_route_table_association" "e" {
  subnet_id      = "${aws_subnet.private2.id}"
  route_table_id = "${aws_route_table.private_rt.id}"
}

resource "aws_route_table_association" "f" {
  subnet_id      = "${aws_subnet.private3.id}"
  route_table_id = "${aws_route_table.private_rt.id}"
} 




