resource "aws_autoscaling_group" "application" {
  name                = "${var.name_prefix}-asg"
  vpc_zone_identifier = var.application_subnet_ids
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity

  target_group_arns = [var.alb_target_group_arn]
  health_check_type = "ELB"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.application.id
    version = "$Latest"
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
  }

  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances"
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_policy" "scale_up" {
  name                   = "${var.name_prefix}-scale-up"
  autoscaling_group_name = aws_autoscaling_group.application.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 1
  cooldown               = 300
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "${var.name_prefix}-scale-down"
  autoscaling_group_name = aws_autoscaling_group.application.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = -1
  cooldown               = 300
}
