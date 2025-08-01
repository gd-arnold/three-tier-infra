variable "name_prefix" {
  description = "Prefix to be used in naming of all resources"
  type        = string
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "az_count" {
  type    = number
  default = 2
}

variable "db_port" {
  type    = number
  default = 3306 # default MySQL port
}

variable "tags" {
  type    = map(string)
  default = {}
}

