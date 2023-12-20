locals {
  vpc_id = aws_vpc.aws_vpc.id
}

locals {
  gateway_id = aws_internet_gateway.igw.id
}

locals {
  pub_subnet_id = aws_subnet.pub_subnet.id
}

locals {
  route_table_id = aws_route_table.pub_rt.id
}

 locals {
   instance = aws_instance.web.id
 }

 locals {
   allocation_id = aws_eip.eip.id
 }

 locals {
   nat_gateway_id = aws_nat_gateway.nat_gateway.id
 }

 locals {
   priv_subnet_id = aws_subnet.priv_subnet.id
 }

 locals {
   priv_route_table_id = aws_route_table.priv_rt.id
 }