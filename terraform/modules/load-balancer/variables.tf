variable "name_prefix" {
  description = "Prefix to be used in naming of all resources"
  type        = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "alb_sg_id" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
