resource "aws_eip" "nat" {
  tags = {
    Name = "cloud-midterm-nat-eip"
  }
}

resource "aws_eip" "wp_server" {
  tags = {
    Name = "cloud-midterm-wordpress-eip"
  }
}