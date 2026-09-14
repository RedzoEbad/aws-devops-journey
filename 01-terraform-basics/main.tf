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


resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name
  tags = {
    Name        = "My bucket"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.mybucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

variable "environment" {
  description = "Enviroment name"
  type        = string
  default     = "dev"
}

variable "bucket_name" {
  description = "s3 bucket name"
  type = string
  default = "ebad-terraform-demo-20242212121212"
}