variable "environment" {
  description = "env for dev"
  type        = string
  default     = "dev"
}
locals {

  vpc_name = "${var.environment}-my_vpc"
}