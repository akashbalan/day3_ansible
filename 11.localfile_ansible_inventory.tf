resource "local_file" "ansible-inventory-file" {
  content = templatefile("publicservers.tpl",
    {
      server1-pub-ip = aws_instance.public_webservers.0.public_ip
      server2-pub-ip = aws_instance.public_webservers.1.public_ip
      server3-pub-ip = aws_instance.public_webservers.2.public_ip
      server1-pub-pvt-ip = aws_instance.public_webservers.0.private_ip
      server2-pub-pvt-ip = aws_instance.public_webservers.1.private_ip
      server3-pub-pvt-ip = aws_instance.public_webservers.2.private_ip
      server1-pvt-ip = aws_instance.private_webservers.0.private_ip
      server2-pvt-ip = aws_instance.private_webservers.1.private_ip
      server3-pvt-ip = aws_instance.private_webservers.2.private_ip
    }
  )
  filename = "${path.module}/invfile"
}