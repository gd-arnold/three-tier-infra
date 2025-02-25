output "db_instance_arn" {
  value = aws_db_instance.db.arn
}

output "db_instance_status" {
  value = aws_db_instance.db.status
}

output "db_password_secret_arn" {
  value = aws_secretsmanager_secret.db_password.arn
}
