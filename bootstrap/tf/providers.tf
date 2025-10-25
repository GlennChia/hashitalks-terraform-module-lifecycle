terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.65"
    }
    github = {
      source  = "integrations/github"
      version = "~> 6.6.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.16.0"
    }
  }
}

provider "tfe" {
}

provider "github" {
  token = var.github_token
}

provider "aws" {
  region = "us-east-1"
}