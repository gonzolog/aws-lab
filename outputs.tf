output "bastion_public_ip" {
  description = "Public IP of bastion host - used as SSH jumpbox"
  value       = aws_instance.bastion.public_ip
}

output "web_public_ip" {
  description = "Public IP of the web server"
  value       = aws_instance.web.public_ip
}

output "web_private_ip" {
  description = "Private IP of the web server"
  value       = aws_instance.web.private_ip
}

output "private_private_ip" {
  description = "Private IP of the private EC2 instance"
  value       = aws_instance.private.private_ip
}
