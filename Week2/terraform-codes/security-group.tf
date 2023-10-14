// Default SG
resource "aws_default_security_group" "test-vpc_sg_default"{

  vpc_id = aws_vpc.test-vpc.id

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = -1
    self      = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

########### Bastion (EC2 Instance) Security Group ###########

resource "aws_security_group" "test-sg-bastion" {

  name   = "test-sg-bastion"
  vpc_id = aws_vpc.test-vpc.id

  ingress {
    description = "ingress security_group_rule for bastion"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "egress security_group_rule for bastion"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "test-sg-bastion"
  }
}

########### EKS Security Group ###########
// EKS Control Plane SG
// - 컨트롤 플레인과 워커 노드 그룹 간의 통신
resource "aws_security_group" "test-eks_sg_controlplane" {

  vpc_id = aws_vpc.test-vpc.id
  name = "Test-EKS-SG-ControlPlane"
  description = "Communication between the control plane and worker nodegroups"

  tags = {
    "Name" = "Test-EKS-ControlPlane-SG"
  }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = -1
    self      = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

// EKS Worker Node SG - 클러스터의 워커 노드에 대한 보안 그룹
resource "aws_security_group" "test-eks_sg_nodes" {

  vpc_id = aws_vpc.test-vpc.id
  name = "Test-EKS-SG-NodeGroup"
  description = "Security group for worker nodes in Cluster"

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = -1
    self      = false
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "Test-EKS-NodeGroup-SG"
  }
}
