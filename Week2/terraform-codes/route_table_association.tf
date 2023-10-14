// 명시적 서브넷 연결
resource "aws_route_table_association" "test-route-association-pub-sub" {

    // 서브넷 리스트 변수 항목의 개수를 가져옴
    count = length(var.aws_vpc_public_subnets)

    // 서브넷 ID를 항목 개수에 맞춰 순차적으로 설정
    subnet_id = aws_subnet.test-public-subnet[count.index].id

    // 라우트 테이블 ID
    route_table_id = aws_route_table.test-route-table-pub-sub.id
    
}
