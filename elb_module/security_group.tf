resource "aws_security_group" "elb_sg" {
  name        = "elb_sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_test_id

  ingress {
    # SSH Port 22 allowed from any IP
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    # SSH Port 22 allowed from any IP
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
  tags = {
  Name = "elb_sg"
}
}

output "security_group_elb"{
  value = aws_security_group.elb_sg.id
}
