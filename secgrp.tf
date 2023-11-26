resource "aws_security_group" "treten-sg" {
  name        = "treten-sg"
  description = "Allow traffic from all sources"
  vpc_id      = aws_vpc.tretenvpc.id

  ingress {
    description = "Allow only connection from my ip"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "treten-sg"
  }
}