resource "aws_security_group" "bz_sg" {
  name        = "bz-security-group"
  description = "Allow inbound traffic on port 5000 for the app"
  vpc_id      = aws_vpc.bz_vpc.id

  # Allow inbound traffic on port 5000 (TCP)
  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    security_groups = [aws_security_group.lb_sg.id]  # Allow traffic from ALB
  }

  # Allow outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]  # Allows outbound traffic to any destination
  }

  tags = {
    Name = "bz-sg"
  }
}

resource "aws_security_group" "lb_sg" {
  name        = "lb-sg"
  description = "Allow inbound HTTP traffic to the ALB"
  vpc_id      = aws_vpc.bz_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
