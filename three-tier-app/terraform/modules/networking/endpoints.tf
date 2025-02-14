resource "aws_vpc_endpoint" "ssm" {
  vpc_id              = aws_vpc.this.id
  service_name        = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  subnet_ids          = aws_subnet.application[*].id
  security_group_ids  = [aws_security_group.application.id]

  tags = merge(
    var.tags,
    {
      Name = "${var.name_prefix}-ssm-endpoint"
    }
  )
}

resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id              = aws_vpc.this.id
  service_name        = "com.amazonaws.${var.region}.ssmmessages"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  subnet_ids          = aws_subnet.application[*].id
  security_group_ids  = [aws_security_group.application.id]

  tags = merge(
    var.tags,
    {
      Name = "${var.name_prefix}-ssmmessages-endpoint"
    }
  )
}

resource "aws_vpc_endpoint" "ec2messages" {
  vpc_id              = aws_vpc.this.id
  service_name        = "com.amazonaws.${var.region}.ec2messages"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  subnet_ids          = aws_subnet.application[*].id
  security_group_ids  = [aws_security_group.application.id]

  tags = merge(
    var.tags,
    {
      Name = "${var.name_prefix}-ec2messages-endpoint"
    }
  )
}
