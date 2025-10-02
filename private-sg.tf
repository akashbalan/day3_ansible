resource "aws_security_group" "allow_only" {
  name        = "allow_only"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.default.id




  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/20"]
  }

  ingress {
    from_port   = 3389 #Remote Desktop (Windows)
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/20"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306 #MySQL Database
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/20"]
  }



  # lifecycle {
  #   ignore_changes = [
  #     ingress,
  #   ]
  # }
}
