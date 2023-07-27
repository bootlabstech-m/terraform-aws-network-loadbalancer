resource "aws_lb" "loadbalancer" {
  name               = var.lb_name
  internal           = var.internal
  ip_address_type    = var.ip_address_type
  load_balancer_type = var.load_balancer_type
  enable_deletion_protection = false
  security_groups    = var.security_groups
  subnets            = var.subnets
}

resource "aws_lb_target_group" "tg" {
  name     = var.target_group_name
  port     = var.target_port
  protocol = var.target_protocol
  vpc_id   = var.vpc_id
  target_type = var.target_type
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.target_id
  port             = var.target_port
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.loadbalancer.arn
  port              = var.listener_port
  protocol          = var.listener_protocol
  ssl_policy        = var.ssl_policy
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}