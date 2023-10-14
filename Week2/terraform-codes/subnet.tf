resource "aws_subnet" "test-public-subnet" {

  // 프로비저닝 전 VPC 생성
  depends_on = [
    aws_vpc.test-vpc
  ]

  // VPC ID
  vpc_id = aws_vpc.test-vpc.id

  // 서브넷 리스트 변수 항목의 개수를 가져옴
  count = length(var.aws_vpc_public_subnets)

  // 가용 영역
  availability_zone = var.aws_azs[count.index]

  // IPv4 subnet CIDR block
  cidr_block = var.aws_vpc_public_subnets[count.index]

  // 퍼블릭 IPv4 주소 자동 할당
  map_public_ip_on_launch = true

  tags = {

    // 서브넷 별 태그 번호 순차 변경
    Name = "test-public-subnet${count.index+1}"

    // 서브넷에 로드 밸런서 배포시 필요한 태그 - 퍼블릭 서브넷
    "kubernetes.io/role/elb" = 1
  }

}