terraform {
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket         = "aws-lab-tf-statefile"
    key            = "aws-lab/foundation/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_eip" "bastion" {
  domain = "vpc"

  tags = {
    name = "cloud-lab-bastion-eip"
  }
}
