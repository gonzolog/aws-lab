variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-west-2"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI for EC2 instances"
  type        = string
  default     = "ami-0a0ff88d0f3f85a14"
}

variable "key_name" {
  description = "name of SSH key pair"
  type        = string
  default     = "wsl-cloudstation-key"
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key used for EC2 access"
  type        = string
}

variable "my_ip_cidr" {
  description = "My public IP in CIDR format"
  type        = string
}

variable "web_private_ip" {
  description = "Static private IP for the web server"
  type = string
}

variable "bastion_private_ip" {
  description = "Static private IP for the bastion host"
  type = string
}

variable "private_private_ip" {
  description = "Static private IP for the private EC2 instance"
  type = string
}# actions test
