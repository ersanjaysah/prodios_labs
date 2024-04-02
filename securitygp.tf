// creating sg for load balancer
resource "aws_security_group" "alb_sg" {
  name        = "ALB-SG"
  description = "Allow inbound HTTP and HTTPS traffic"
  vpc_id      = aws_vpc.custom_VPC.id

  dynamic "ingress" {
    for_each = var.ports
    content {
      description = "inbound rule"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb-Ssecurity-gp"
  }
}