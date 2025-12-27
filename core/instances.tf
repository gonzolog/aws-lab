# AWS Key Pair - Local SSH public key
resource "aws_key_pair" "wsl" {
  key_name   = var.key_name
  public_key = file(var.ssh_public_key_path)
}

# Bastion Host (SSH entry point)
resource "aws_instance" "bastion" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  key_name               = aws_key_pair.wsl.key_name
  private_ip = var.bastion_private_ip

  tags = {
    Name = "cloud-lab-bastion"
    Role = "bastion"
  }
}

# Web Server (public, nginx)
resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = aws_key_pair.wsl.key_name
  user_data              = file("${path.module}/scripts/public-userdata.sh")
  private_ip = var.web_private_ip

  tags = {
    Name = "cloud-lab-web"
    Role = "web"
  }
}

resource "aws_instance" "private" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  key_name               = aws_key_pair.wsl.key_name
  private_ip = var.private_private_ip

  associate_public_ip_address = false

  tags = {
    Name = "cloud-lab-private"
    Role = "private"
  }
}

