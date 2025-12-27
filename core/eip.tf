data "aws_eip" "bastion" {
  filter {
    name = "tag:name"
    values = ["cloud-lab-bastion-eip"]
  }
}

resource "aws_eip_association" "bastion" {
  allocation_id = data.aws_eip.bastion.id
  instance_id = aws_instance.bastion.id
}