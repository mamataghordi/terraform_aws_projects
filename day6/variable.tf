variable "environment" {
  description = "env for dev"
  type        = string
  default     = "dev"
}
locals {

  vpc_name = "${var.environment}-my_vpc"
}
variable "monitoring_enable" {
  description = "Enable detailed monitoring"
  type        = bool
  default     = true
}
variable "associate_public_ip_address" {
  description = "Associate Public IP Address"
  type        = bool
  default     = true

}
variable "cidr_block" {
  description = "vpc cidr block"
  type        = list(string)
  default     = ["10.0.0.0/16", "192.168.0.0/16", "172.16.0.0/16"]
}
variable "instance_types" {
  description = "Instance types"
  type        = list(string)
  default     = ["t2.micro", "t3.micro", "t3a.micro"]
}
variable "tags" {
  description = "tags for instance"
  type        = map(string)
  default = {
    Name        = "dev-instance"
    Environment = "dev"

  }
}

variable "ingress_values" {
  type    = tuple([number, string, number])
  default = [443, "tcp", 443]
}
variable "config" {
  type = object({
    region         = string
    instance_count = number
    monitoring     = bool
  })
  default = {
    region         = "ap-south-1"
    instance_count = 1
    monitoring     = true
  }
}
