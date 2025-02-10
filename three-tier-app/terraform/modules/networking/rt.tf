resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.name_prefix}-public-rt"
    }
  )
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.name_prefix}-private-rt"
    }
  )
}

resource "aws_route_table_association" "public" {
  count          = var.az_count
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public[count.index].id
}

resource "aws_route_table_association" "application" {
  count          = var.az_count
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.application[count.index].id
}

resource "aws_route_table_association" "database" {
  count          = var.az_count
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.database[count.index].id
}
