resource "aws_route_table_association" "terraform-public" {
  #count             = 4 # 0 1 2
  count = length(local.new_public_subnet_cidrs)
  #Using * is called Splat Syntax
  subnet_id      = element(aws_subnet.public-subnets.*.id, count.index)
  route_table_id = aws_route_table.terraform-public.id
}