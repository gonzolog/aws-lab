# AWS Key Pair
resource "aws_key_pair" "wsl" {
  key_name   = "wsl-cloudstation-key"
  public_key = file("${path.module}/id_rsa.pub")
}

# Public Server
resource "aws_instance" "vm" {
  ami                    = "ami-0a0ff88d0f3f85a14" # Ubuntu 22.04 in eu-west-2
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = aws_key_pair.wsl.key_name

  tags = {
    Name = "cloud-lab-instance"
  }
}

# Private Server
resource "aws_instance" "private_vm" {
  ami                    = "ami-0a0ff88d0f3f85a14" # same Ubuntu AMI you used before
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  key_name               = aws_key_pair.wsl.key_name

  associate_public_ip_address = false

  tags = {
    Name = "cloud-lab-private-instance"
  }
}
