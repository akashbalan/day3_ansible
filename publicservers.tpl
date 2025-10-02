[pub-pub-ip]
server1 ansible_port=22 ansible_host=${server1-pub-ip} ansible_user=ubuntu ansible_ssh_private_key=/etc/ansible/ansiblekey.pem
server2 ansible_port=22 ansible_host=${server2-pub-ip} ansible_user=ubuntu ansible_ssh_private_key=/etc/ansible/ansiblekey.pem
server3 ansible_port=22 ansible_host=${server3-pub-ip} ansible_user=ubuntu ansible_ssh_private_key=/etc/ansible/ansiblekey.pem

[pub-pvt-ip]
server-pub-pvt-1 ansible_port=22 ansible_host=${server1-pub-pvt-ip} ansible_user=ubuntu ansible_ssh_private_key=/etc/ansible/ansiblekey.pem
server-pub-pvt-2 ansible_port=22 ansible_host=${server2-pub-pvt-ip} ansible_user=ubuntu ansible_ssh_private_key=/etc/ansible/ansiblekey.pem
server-pub-pvt-3 ansible_port=22 ansible_host=${server3-pub-pvt-ip} ansible_user=ubuntu ansible_ssh_private_key=/etc/ansible/ansiblekey.pem


[pvt-pvt-ip]
server-pvt-1 ansible_port=22 ansible_host=${server1-pvt-ip} ansible_user=ubuntu ansible_ssh_private_key=/etc/ansible/ansiblekey.pem
server-pvt-2 ansible_port=22 ansible_host=${server2-pvt-ip} ansible_user=ubuntu ansible_ssh_private_key=/etc/ansible/ansiblekey.pem
server-pvt-3 ansible_port=22 ansible_host=${server3-pvt-ip} ansible_user=ubuntu ansible_ssh_private_key=/etc/ansible/ansiblekey.pem



