terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.16.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "cidr_block" {
  description = "The VPC CIDR Block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "resource_prefix" {
  description = "Prefix added to resource names"
  type        = string
  default     = "tf-module-lifecycle-demo"
}

module "vpc" {
  source  = "app.terraform.io/glenn-hcp-premium/network/aws"
  version = "1.1.0"

  cidr_block      = var.cidr_block
  resource_prefix = var.resource_prefix
}