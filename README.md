# AWS Terraform Lab

This repository is a hands-on Terraform lab designed to demonstrate infrastructure provisioning on AWS using modern, real-world best practices.

The focus of this project is not just creating AWS resources, but understanding how **infrastructure design, networking, automation, state management, and version control** work together in a professional environment.

---

## What this project demonstrates

- AWS VPC design with public and private subnets
- Internet Gateway and NAT Gateway configuration
- EC2 provisioning in public and private networks
- Bastion host (jump box) pattern for secure SSH access
- Persistent Elastic IP management
- Security group design for controlled access
- Terraform remote state using S3
- State locking using DynamoDB
- Separation of persistent and ephemeral infrastructure
- Feature-branch Git workflow for infrastructure changes
- Incremental, testable infrastructure development

---

## Architecture overview

- One VPC (`10.0.0.0/16`)
- One public subnet (internet-facing)
- One private subnet (outbound-only via NAT Gateway)
- Bastion host in the public subnet
  - Uses a **persistent Elastic IP**
  - Acts as the single SSH entry point
- Public web EC2 instance (NGINX)
- Private EC2 instance (no direct internet access)
- Static private IP assignments for internal consistency
- Security groups enforcing:
  - SSH access only via bastion
  - HTTP access only where required

---

## Repository structure

```text
aws-lab/
├── foundation/              # Persistent infrastructure
│   ├── main.tf              # Backend + provider config
│   ├── outputs.tf           # EIP outputs
│   └── terraform.tfstate    # Remote (S3)
│
├── core/                    # Ephemeral infrastructure
│   ├── main.tf              # Backend + provider config
│   ├── vpc.tf               # VPC and subnet definitions
│   ├── routes.tf            # Route tables and gateways
│   ├── security.tf          # Security groups
│   ├── instances.tf         # EC2 instances
│   ├── variables.tf         # Input variables
│   ├── outputs.tf           # Exported values
│   └── scripts/             # EC2 user_data scripts
│
├── README.md
└── .gitignore
