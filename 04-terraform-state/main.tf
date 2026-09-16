terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket       = "ebad-terraform-state-2024-5442423"
    key          = "04-terraform-state/terraform.tfstate"
    region       = "ap-southeast-1"
    use_lockfile = true
  }
}

provider "aws" {
  region = "ap-southeast-1"
}



resource "aws_s3_bucket" "test" {
  bucket = "ebad-state-test-123456789"

  tags = {
    Environment = "test"
    ManagedBy   = "terraform"
  }
}