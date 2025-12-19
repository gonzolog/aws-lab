output "public_ec2_public_ip" {
  description = "Public IP of the public EC2 instance"
  value       = aws_instance.vm.public_ip
}

output "public_ec2_private_ip" {
  description = "Private IP of the public EC2 instance"
  value       = aws_instance.vm.private_ip
}

output "private_ec2_private_ip" {
  description = "Private IP of the private EC2 instance"
  value       = aws_instance.private_vm.private_ip
}
