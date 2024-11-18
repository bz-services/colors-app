# Create Loadbalancer for ECS
resource "aws_lb" "bz_lb" {
  name               = "bz-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.lb_security_groups
  subnets            = var.subnets

  enable_deletion_protection = false

  tags = {
    Name = "bz-lb"
  }
}

# Create Target Group for ECS
resource "aws_lb_target_group" "bz_target_group" {
  name     = "bz-target-group"
  port     = 5000
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  target_type = "ip"

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "bz-target-group"
  }
}

# Create Listener for ECS
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.bz_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.bz_target_group.arn
  }
}

