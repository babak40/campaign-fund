// Use data source to filter out Ubuntu image that belongs to canonical user
data "aws_ami" "ubuntu_image" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

// Create a tls_private_key resource using RSA key
resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

// Create AWS key pair resource to allow SSH access to the instance
resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = tls_private_key.this.public_key_openssh

  # Create key to your local computer!!
  provisioner "local-exec" {
    command = "echo '${tls_private_key.this.private_key_pem}' > ./instance_key.pem"
  }
}

// Template file to pass in user data
data "template_file" "this" {
  template = file(var.template_file)
}

resource "aws_instance" "this" {
  ami                         = data.aws_ami.ubuntu_image.id
  key_name                    = aws_key_pair.this.id
  instance_type               = var.instance_type
  monitoring                  = var.monitoring
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = var.associate_public_ip_address
  user_data                   = data.template_file.this.rendered
  ebs_block_device {
    delete_on_termination = var.delete_on_termination
    device_name           = var.device_name
    encrypted             = var.encrypted
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    tags                  = var.tags
  }

  tags = var.tags
}
