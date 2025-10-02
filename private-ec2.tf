resource "aws_instance" "private_webservers" {
  count                       = local.new_environment == "production" ? 3 : 1
  #count                       = 3
  ami                         = data.aws_ami.my_ami.id
  instance_type               = lookup(var.instance_type, local.new_environment)
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.private-subnets.*.id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.allow_only.id}"]

  tags = {
    Name              = "${var.vpc_name}-PrivateServer-${count.index + 1}"
    Terraform-Managed = "Yes"
    Env               = local.new_environment
    ProjectID         = local.projid
    ManagedBy         = "Terraform"
  }
}
