resource "aws_db_parameter_group" "db_parameter_group" {
  name   = "${var.name_prefix}-db-parameter-group"
  family = "mysql8.0"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }

  tags = merge(
    var.tags,
    {
      Name : "${var.name_prefix}-db-parameter-group"
    }
  )
}

resource "aws_db_instance" "db" {
  identifier             = "${var.db_name}-db"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = var.db_instance_class
  allocated_storage      = var.db_allocated_storage
  max_allocated_storage  = 100
  db_name                = var.db_name
  username               = var.db_username
  password               = random_password.db_password.result
  parameter_group_name   = aws_db_parameter_group.db_parameter_group.name
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = [var.db_sg_id]
  publicly_accessible    = false

  multi_az = true

  backup_retention_period = 7
  backup_window           = "03:00-04:00"
  maintenance_window      = "mon:04:00-mon:05:00"

  performance_insights_enabled          = true
  performance_insights_retention_period = 7

  storage_type      = "gp2"
  storage_encrypted = true

  deletion_protection = false

  monitoring_interval = 0

  tags = merge(
    var.tags,
    {
      Name : "${var.name_prefix}-db"
    }
  )
}
