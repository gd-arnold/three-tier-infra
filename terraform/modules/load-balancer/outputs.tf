output "load_balancer_id" {
  value = aws_lb.this.id
}

output "load_balancer_arn" {
  value = aws_lb.this.arn
}

output "load_balancer_dns_name" {
  value = aws_lb.this.dns_name
}

output "application_tg_id" {
  value = aws_lb_target_group.application_tg.id
}

output "application_tg_arn" {
  value = aws_lb_target_group.application_tg.arn
}
