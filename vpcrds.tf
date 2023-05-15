provider "aws"{
    region ="us-east-2"
    access_key=""
    secret_key=""
}





resource "aws_vpc" "privatevpc2" {
  cidr_block = "172.17.0.0/16"
  tags = {
    Name = "privatevpc2"
  }
}

resource "aws_subnet" "us-east-2a" {
  vpc_id = aws_vpc.privatevpc2.id
  cidr_block = "172.17.1.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name = "us-east-2a"
  }
}

resource "aws_subnet" "us-east-2b" {
  vpc_id = aws_vpc.privatevpc2.id
  cidr_block = "172.17.2.0/24"
  availability_zone = "us-east-2b"
  tags = {
    Name = "us-east-2b"
  }
}

resource "aws_db_subnet_group" "dbsubnetgroup" {
  name       = "dbsubnetgroup"
  subnet_ids = [aws_subnet.us-east-2a.id, aws_subnet.us-east-2b.id]
}

resource "aws_db_instance" "dbinstance2" {
  identifier = "dbinstance2"
  engine = "mariadb"
  instance_class = "db.t3.micro"
  allocated_storage = 26
  username = "yourusername12"
  password = "yourpassword23"
  db_subnet_group_name = aws_db_subnet_group.dbsubnetgroup.name
}

output "VPC-ID" {
  value = aws_vpc.privatevpc2.id
}

output "Subnet-ID-1" {
  value = aws_subnet.us-east-2a.id
}

output "Subnet-ID-2" {
  value = aws_subnet.us-east-2b.id
}

output "DBSubnetGroup-ID" {
  value = aws_db_subnet_group.dbsubnetgroup.id
}

output "RDSInstance-ID" {
  value = aws_db_instance.dbinstance2.id
}
