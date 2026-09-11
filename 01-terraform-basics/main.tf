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
  bucket = "ebad-terraform-demo-20242212121212"
}