resource "aws_iam_role" "application_role" {
  name = "${var.name_prefix}-application-iam-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = merge(
    var.tags,
    {
      Name : "${var.name_prefix}-application-iam-role"
    }
  )
}

resource "aws_iam_policy_attachment" "ssm" {
  name       = "${var.name_prefix}-application-ssm-attachment"
  roles      = [aws_iam_role.application_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "app_profile" {
  name = "${var.name_prefix}-application-profile"
  role = aws_iam_role.application_role.name

  tags = merge(
    var.tags,
    {
      Name : "${var.name_prefix}-application-profile"
    }
  )
}
