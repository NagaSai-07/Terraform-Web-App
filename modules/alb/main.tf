resource "aws_lb" "web_alb" {
    name = "${var.project}-ALB"
    internal = false
    load_balancer_type = "application"
    subnets = var.public_subnet_ids
    security_groups = var.security_group_ids

    tags = {
        Name = "${var.project}-ALB"
    }
}

resource "aws_lb_target_group" "web_tg" {
    name = "${var.project}-TG"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id

    health_check {
        path = "/"
        protocol = "HTTP"
        interval = 30
        timeout = 5
        healthy_threshold = 2
        unhealthy_threshold = 2
    }

    tags = {
        Name = "${var.project}-TG"
    }
}

resource "aws_lb_target_group_attachment" "web_instance" {
  target_group_arn = aws_lb_target_group.web_tg.arn
  target_id        = var.instance_id
  port             = 80
}


resource "aws_lb_listener" "web_listener" {
    load_balancer_arn = aws_lb.web_alb.arn
    port = 80
    protocol = "HTTP"

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.web_tg.arn
    }
}