resource "aws_security_group" "allow_only" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.default.id




  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.1.1.0/32"]
  }

  ingress {
    from_port   = 3389 #Remote Desktop (Windows)
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["10.1.1.0/32"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306 #MySQL Database
    protocol    = "tcp"
    cidr_blocks = ["10.2.1.0/32"]
  }



  # lifecycle {
  #   ignore_changes = [
  #     ingress,
  #   ]
  # }
}
