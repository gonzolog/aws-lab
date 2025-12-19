# AWS Terraform Lab

This repository is a hands-on Terraform lab designed to demonstrate
infrastructure provisioning on AWS using modern best practices.

The focus of this project is not just resource creation, but understanding
how infrastructure, networking, automation, and version control work together.

---

## What this project demonstrates

- AWS VPC design with public and private subnets
- Internet Gateway and NAT Gateway configuration
- EC2 provisioning in public and private networks
- Security group design for controlled access
- Terraform remote state using S3
- State locking using DynamoDB
- Feature-branch Git workflow for infrastructure changes
- Incremental, testable infrastructure development

---

## Architecture overview

- One VPC
- One public subnet (internet-facing)
- One private subnet (outbound-only via NAT Gateway)
- Public EC2 instance (used for application access)
- Private EC2 instance (no direct internet access)
- Security groups controlling SSH and HTTP access

---

## Repository structure

├── main.tf # Terraform configuration and backend
├── vpc.tf # VPC and subnet definitions
├── routes.tf # Route tables and gateways
├── security.tf # Security groups
├── instances.tf # EC2 instances
├── variables.tf # Reusable input variables
├── outputs.tf # Exported infrastructure values
└── user_data.sh # EC2 bootstrapping script

---

## Terraform state management

- Terraform state is stored remotely in an S3 bucket
- DynamoDB is used for state locking to prevent concurrent modifications
- State backend is created outside Terraform as a bootstrap step

---

## Workflow

All infrastructure changes follow a feature-branch workflow:

1. Create a feature branch for a single change
2. Implement and test the change locally
3. Run `terraform plan` and `terraform apply`
4. Commit and push the branch
5. Open a Pull Request and merge into `main`

This mirrors real-world infrastructure workflows used in team environments.

---

## Purpose

This repository exists as a learning and demonstration project to build
practical understanding of cloud infrastructure, Terraform, and DevOps workflows.