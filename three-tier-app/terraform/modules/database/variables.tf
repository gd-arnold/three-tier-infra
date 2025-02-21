variable "name_prefix" {
  description = "Prefix to be used in naming of all resources"
  type        = string
}

variable "vpc_id" {
  type = string
}

variable "db_sg_id" {
  type = string
}

variable "db_subnet_group_name" {
  type = string
}

variable "db_instance_class" {
  type    = string
  default = "db.t2.micro" # Free tier eligible
}

variable "db_allocated_storage" {
  type    = number
  default = 20
}

variable "db_name" {
  type = string
}

variable "db_username" {
  type    = string
  default = "admin"
}

variable "tags" {
  type    = map(string)
  default = {}
}

