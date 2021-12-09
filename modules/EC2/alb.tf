
resource "aws_lb" "PrakashALB" {
  name               = "PrakashTF-ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.public_subnets

  enable_deletion_protection = false

  tags = {
    Name = "PrakashTF-ALB"
    envronment="training"
  }
}

resource "aws_lb_target_group" "PrakashTF-TG" {
  name     = "PrakashTF-TG"
  port     = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = var.vpc_id
  
}

resource "aws_lb_target_group_attachment" "PrakashTGA1" {
  target_group_arn = aws_lb_target_group.PrakashTF-TG.arn
  target_id        = aws_instance.PrakashInstances[count.index].id
  port             = 80
  count = length(aws_instance.PrakashInstances)
}


resource "aws_lb_listener" "PrakashALBListener" {
  load_balancer_arn = aws_lb.PrakashALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.PrakashTF-TG.arn
  }
}
