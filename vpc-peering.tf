data "aws_vpc" "ansible_vpc" {
  id = "vpc-0308b201409da7fb6"
}

data "aws_route_table" "ansible_vpc_rt" {
  subnet_id = "subnet-01b611d547b00f033"
  #If subnet_id giving errors use route table id as below
  #route_table_id = data.aws_route_table.ansible_vpc_rt.id
}

resource "aws_vpc_peering_connection" "ansible-vpc-peering" {
  peer_vpc_id = data.aws_vpc.ansible_vpc.id
  vpc_id      = aws_vpc.default.id
  auto_accept = true
  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags = {
    Name = "Ansible-${var.vpc_name}-Peering"
  }
}

resource "aws_route" "peering-to-ansible-vpc" {
  route_table_id            = aws_route_table.terraform-public.id #from client
  destination_cidr_block    = "10.0.0.0/16" # to controller
  vpc_peering_connection_id = aws_vpc_peering_connection.ansible-vpc-peering.id #through this connection
  #depends_on                = [aws_route_table.terraform-public]
}

resource "aws_route" "peering-from-ansible-vpc" {
  route_table_id            = data.aws_route_table.ansible_vpc_rt.id #from controller
  destination_cidr_block    = "10.37.0.0/16" #to client
  vpc_peering_connection_id = aws_vpc_peering_connection.ansible-vpc-peering.id #through this connection
  #depends_on                = [aws_route_table.terraform-public]
}

#note only public subnets are able to connect but its able to connect to both pvt and public subnets