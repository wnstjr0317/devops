resource "aws_vpc" "test-vpc" {

  // 이름 태그
  tags = {
    Name = "test-vpc"
  }

  // IPv4 CIDR - 변수에서 참조
  cidr_block = var.aws_vpc_cidr_block

  // DNS 호스트 이름 - 활성화됨
  enable_dns_hostnames = "true"

  // DNS 확인 - 활성화됨
  enable_dns_support = "true"
}