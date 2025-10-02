resource "aws_route_table" "terraform-private" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name              = "${var.vpc_name}-Private-RT"
    Terraform-Managed = "Yes"
    Env               = local.new_environment
    ProjectID         = local.projid
  }
}