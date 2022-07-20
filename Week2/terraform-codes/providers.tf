terraform {
  
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.22.0"
    }
  }

  backend "s3" {
    bucket = "test-comento-s3-tf-state"
    key = "terraform.tfstate"
    region = "ap-northeast-2"
    dynamodb_table = "test-ddb-tf-lock"
    encrypt = "true"
  }
}

provider "aws" {
  region = var.aws_region
}