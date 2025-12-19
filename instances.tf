# AWS Key Pair
resource "aws_key_pair" "wsl" {
  key_name   = var.key_name
  public_key = file(var.ssh_public_key_path)
}

# Public Server
resource "aws_instance" "vm" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = aws_key_pair.wsl.key_name

  tags = {
    Name = "cloud-lab-instance"
  }
}

# Private Server
resource "aws_instance" "private_vm" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  key_name               = aws_key_pair.wsl.key_name

  associate_public_ip_address = false

  tags = {
    Name = "cloud-lab-private-instance"
  }
}
