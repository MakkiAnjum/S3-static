provider "aws" {
  region = "eu-west-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  vpc_security_group_ids      = [module.vpc.default_security_group_id, aws_security_group.ec2_app_server_sg.id]
  subnet_id                   = module.vpc.public_subnets[0]
  key_name                    = var.key_pair_name
  associate_public_ip_address = true

  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "ec2_app_server_sg" {
  name        = "${var.instance_name}-sg"
  description = "Security group for EC2 instance"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.19.0"

  name = "cloud-prep-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  public_subnets  = ["10.0.0.0/24"]
  private_subnets = ["10.0.1.0/24"]


  enable_dns_hostnames = true
}

resource "local_file" "ansible_inventory" {
  content  = <<-EOT
    ---
    webservers:
      hosts:
        ${aws_instance.app_server.public_ip}:
           ansible_host: ${aws_instance.app_server.public_ip}
           ansible_user: ubuntu
           ansible_ssh_private_key_file: ~/.ssh/id_rsa
  EOT
  filename = "../ansible/inventory/inventory.yml"
}
