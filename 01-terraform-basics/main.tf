terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
  
}

data "aws_caller_identity" "current" {}

output "account_id" {
  description = "AWS Account ID"
  value       = data.aws_caller_identity.current.account_id
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
}


output "region"{
  value = data.aws_ami.amazon_linux.id
}

resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name
  tags = merge(local.common_tags , {
    Name = "${local.prefix}-s3"
  })
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.mybucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

variable "Environment" {
  description = "Enviroment name"
  type        = string
  default     = "dev"
}

variable "bucket_name" {
  description = "s3 bucket name"
  type = string
  default = "ebad-terraform-demo-20242212121212"
}


output "bucketname" {
  description = "S3 bucket name"
  value = aws_s3_bucket.mybucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.mybucket.arn
  description = "this is the arn of our s3"
}

output "bucket_domain_name"{
  value = aws_s3_bucket.mybucket.bucket_regional_domain_name
}

locals {
  prefix = "${var.Environment}-ebad"
  common_tags = {
    Environment = var.Environment   
    ManagedBy   = "terraform"
    Project     = "terraform-learning"
  }
}