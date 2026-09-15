terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

module "s3-prod" { 
  source = "./modules/s3"
   bucket_name = "dskjfdkfjdfjksjfkdj"
   env_name = "prod"
   name_tag = "my bucket"
}


module "s3-dev" { 
  source = "./modules/s3"
   bucket_name = "dskjfdkfjdfjkasdasdsdsjfkdj"
   env_name = "dev"
   name_tag = "my bucket"
}


module "s3-staging" { 
  source = "./modules/s3"
   bucket_name = "sfdsfweasdsdfewvwefewew"
   env_name = "staging"
   name_tag = "my bucket"
}


