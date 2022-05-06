terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.72.0"
    }
  }
}

provider "aws" {

  region = var.region
}




resource "aws_internet_gateway" "primary" {
  vpc_id = aws_vpc.primary.id

  tags = {
    Name = "${var.prefix}-${var.env}-igw"
  }
}


resource "aws_vpc" "primary" {
  cidr_block = var.VPC_CIDR

  tags = {
    Name       = "${var.prefix}-${var.env}-vpc"
    Owner      = var.owner
    CostCenter = "IT"
  }
}




