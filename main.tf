resource "aws_db_instance" "default" {
  allocated_storage    = var.db_storage
  storage_type         = var.storage_type
  db_name              = var.db_name
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = var.skip_final_snapshot

}

##############################################
resource "aws_instance" "web" {
  ami               = var.ami
  instance_type     = var.instance_type
  availability_zone = var.availability_zone
  key_name          = var.key_name

  tags = {
    Name = var.web_tags_name
  }
}
#################################################################
resource "aws_vpc" "aws_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.aws_vpc_tags_name
  }
}
######################################################
resource "aws_subnet" "priv_subnet" {
  vpc_id            = local.vpc_id
  cidr_block        = var.priv_subnet_cidr
  availability_zone = var.availability_zone_prs

  tags = {
    Name = var.priv_subnet_tags
  }
}
##########
resource "aws_subnet" "pub_subnet" {
  vpc_id            = local.vpc_id
  cidr_block        = var.pub_subnet_cidr
  availability_zone = var.availability_zone_pus

  tags = {
    Name = var.pub_subnet_tags
  }
}
#########################################################
resource "aws_route_table" "pub_rt" {
  vpc_id = local.vpc_id

  route {
    cidr_block = var.pub_rt_cidr
    gateway_id = local.gateway_id
  }


  tags = {
    Name = var.pub_rt_tags
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = local.vpc_id

  tags = {
    Name = var.igw_tags
  }
}
################################################################
resource "aws_route_table_association" "pub-rt-ass" {
  subnet_id      = local.pub_subnet_id
  route_table_id = local.route_table_id
}

resource "aws_eip" "eip" {
  instance = local.instance
}
##################################################
resource "aws_nat_gateway" "nat_gateway" {
  subnet_id     = local.pub_subnet_id
  allocation_id = local.allocation_id

  tags = {
    Name = var.nat_gateway_tags
  }
}
#########################################################
resource "aws_route_table" "priv_rt" {
  vpc_id = local.vpc_id

  route {
    cidr_block     = var.priv_rt_cidr
    nat_gateway_id = local.nat_gateway_id
  }

  tags = {
    Name = var.priv_rt_tags
  }
}

################################################################
resource "aws_route_table_association" "priv-rt-ass" {
  subnet_id      = local.priv_subnet_id
  route_table_id = local.priv_route_table_id
}
#########################################################
 resource "aws_security_group" "allow_tls" {
  description = "allow traffic for ports 5432, 22, 80"
  name        = var.allow_tls_name
  vpc_id      = local.vpc_id

  ingress {
    description      = "postgres"
    from_port        = 5432
    to_port          = 5432
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}