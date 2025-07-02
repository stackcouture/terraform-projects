# EC2 Instance
resource "aws_instance" "myec2vm" {
  ami                    = data.aws_ami.ubuntu_ami.id
  instance_type          = var.instance_type
  user_data              = file("${path.module}/app-install.sh")
  key_name               = aws_key_pair.my_ec2key.key_name
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = var.ec2_name
  }
}
