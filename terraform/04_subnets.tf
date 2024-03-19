resource "aws_subnet" "public_wp" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    availability_zone = var.availability_zone

    tags = {
        Name = "cloud-midterm-public-wp"
    }
}

resource "aws_subnet" "private_db_nat" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.2.0/24"
    availability_zone = var.availability_zone

    tags = {
        Name = "cloud-midterm-private-db-nat"
    }
}

resource "aws_subnet" "private_wp_db" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.3.0/24"
    availability_zone = var.availability_zone

    tags = {
        Name = "cloud-midterm-private-wp-db"
    }
}

resource "aws_subnet" "public_nat" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.4.0/24"
    availability_zone = var.availability_zone

    tags = {
        Name = "cloud-midterm-public-nat"
    }
}