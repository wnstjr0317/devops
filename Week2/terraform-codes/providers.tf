terraform {
  
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.22.0"
    }
  }

  backend "s3" {
    bucket = "<AWS S3 Bucket Name>"
    key = "terraform.tfstate"
    region = "ap-northeast-2"
    dynamodb_table = "<AWS DynamoDB Table Name>"
    encrypt = "true"
  }
}

provider "aws" {
  region = var.aws_region
}