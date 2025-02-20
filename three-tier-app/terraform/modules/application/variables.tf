variable "name_prefix" {
  description = "Prefix to be used in naming of all resources"
  type        = string
}

variable "vpc_id" {
  type = string
}

variable "application_subnet_ids" {
  type = list(string)
}

variable "application_sg_id" {
  type = string
}

variable "alb_target_group_arn" {
  type = string
}

variable "db_password_secret_arn" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "desired_capacity" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 2
}

variable "max_size" {
  type    = number
  default = 4
}

variable "tags" {
  type    = map(string)
  default = {}
}
