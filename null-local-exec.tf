resource "null_resource" "webservers" {
  provisioner "local-exec" {
    command = <<EOH
      sleep 10
      mkdir nidu
      ansible -i invfile pub-pub-ip -m ping
      mkdir akash
    EOH
  }
  depends_on = [local_file.ansible-inventory-file]
}

