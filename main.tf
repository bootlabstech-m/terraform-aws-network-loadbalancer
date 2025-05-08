resource "aws_lb" "loadbalancer" {
  name               = var.lb_name
  internal           = var.internal
  ip_address_type    = var.ip_address_type
  load_balancer_type = var.load_balancer_type
  enable_deletion_protection = false
  security_groups    = var.security_groups
  subnets            = var.subnets
    lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_lb_target_group" "tg" {
  name     = var.target_group_name
  port     = var.target_port
  protocol = var.target_protocol
  vpc_id   = var.vpc_id
  target_type = var.target_type
    lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.target_id
  port             = var.target_port
  #   lifecycle {
  #   ignore_changes = [tags]
  # }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.loadbalancer.arn
  port              = var.listener_port
  protocol          = var.listener_protocol


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
    lifecycle {
    ignore_changes = [tags]
  }
}
