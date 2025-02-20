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

resource "aws_iam_policy" "secrets_access" {
  name        = "${var.name_prefix}-secrets-access-policy"
  description = "Policy allowing access to specific secrets"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "secretsmanager:GetSecretValue",
          "secretsmanager:DescribeSecret"
        ]
        Resource = var.db_password_secret_arn
        Effect   = "Allow"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.application_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}


resource "aws_iam_role_policy_attachment" "secrets_access" {
  role       = aws_iam_role.application_role.name
  policy_arn = aws_iam_policy.secrets_access.arn
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
