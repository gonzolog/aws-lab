output "bastion_public_ip" {
  description = "Persistent public IP for the bastion host (Elastic IP)"
  value       = aws_eip.bastion.public_ip
}

output "bastion_allocation_id" {
  description = "Allocation ID for the bastion Elastic IP"
  value       = aws_eip.bastion.allocation_id
}
