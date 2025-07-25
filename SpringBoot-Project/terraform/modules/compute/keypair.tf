 resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "springboot_key"
  public_key = tls_private_key.ec2_key.public_key_openssh
}

resource "local_file" "save_private_key" {
  content = tls_private_key.ec2_key.private_key_pem
  filename = "${pathexpand("~")}/.ssh/springboot_key.pem"
  file_permission = "0600"
}