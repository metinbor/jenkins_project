resource "aws_subnet" "public1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.10.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

}

resource "aws_subnet" "public2" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.11.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"

}

resource "aws_subnet" "public3" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.12.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1c"

}