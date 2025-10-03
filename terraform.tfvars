
aws_region           = "us-east-1"
vpc_cidr             = "10.37.0.0/16"
vpc_name             = "Ansible-Vpc"
key_name             = "ans-con-key"
public_subnet_cidrs  = ["10.37.1.0/24", "10.37.2.0/24", "10.37.3.0/24"]    #List
private_subnet_cidrs = ["10.37.10.0/24", "10.37.20.0/24", "10.37.30.0/24"] #List
azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]          #List
environment          = "production"
instance_type = {
  development = "t3.medium"
  testing     = "t3.medium"
  production  = "t3.medium"
}
amis = {
  us-east-1 = "ami-020cba7c55df1f615" # Canonical, Ubuntu, 20.04 LTS, amd64 focal image
  us-east-2 = "ami-0d1b5a8c13042c939" # Canonical, Ubuntu, 20.04 LTS, amd64 focal image
}
projid    = "PHOENIX-123"
imagename = "ami-020cba7c55df1f615"