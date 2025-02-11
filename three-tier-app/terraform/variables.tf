variable "aws_access_key" {
  type      = string
  sensitive = true
}

variable "aws_secret_key" {
  type      = string
  sensitive = true
}

variable "ssh_client_cidr" {
  type        = string
  description = "Custom IP address block for SSHing into bastion host"
}
