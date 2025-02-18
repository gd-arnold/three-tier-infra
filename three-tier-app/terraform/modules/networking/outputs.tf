output "vpc_id" {
  value = aws_vpc.this.id
}

output "vpc_cidr" {
  value = aws_vpc.this.cidr_block
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "application_subnet_ids" {
  value = aws_subnet.application[*].id
}

output "alb_sg_id" {
  value = aws_security_group.alb.id
}

output "application_sg_id" {
  value = aws_security_group.application.id
}
