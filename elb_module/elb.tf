resource "aws_lb" "elb_test" {
  name               = "elbtest"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.elb_sg.id]
  subnets            = [var.public_subnet_id_1,var.public_subnet_id_2]

  enable_deletion_protection = false
    tags = {
    Environment = "elb-test"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.elb_test.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.test.arn

    }
}

resource "aws_lb_target_group" "test" {
  name     = "tf-test-lb-tg"
  port     = 80
  protocol = "HTTP"
  target_type="instance"
  vpc_id   = var.vpc_test_id
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = var.ec2_name_1
  port             = 80
}
resource "aws_lb_target_group_attachment" "test1" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = var.ec2_name_2
  port             = 80
}


output "elb_test" {
  description = "The DNS name of the ELB"
  value       = aws_lb.elb_test.dns_name
}
