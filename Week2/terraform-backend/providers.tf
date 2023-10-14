terraform {
  
  required_providers {

    // AWS로 Cloud Provider 설정 및 API 변환 바이너리 4.0 이상으로 받음
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

// 리전명을 변수에서 할당
provider "aws" {
  region = var.aws_region
}