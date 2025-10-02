resource "aws_route_table" "terraform-public" {
  vpc_id = aws_vpc.default.id


  tags = {
    Name              = "${var.vpc_name}-MAIN-RT"
    Terraform-Managed = "Yes"
    Env               = local.new_environment
    ProjectID         = local.projid
  }
}

resource "aws_route" "igw-route" {
  route_table_id         = aws_route_table.terraform-public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id
}
