output "asg_name" {
  value = aws_autoscaling_group.application.name
}

output "launch_template_id" {
  value = aws_launch_template.application.id
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.app_profile.name
}
