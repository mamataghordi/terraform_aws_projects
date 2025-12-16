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
variable "instance_count"{
  description = "instance count"
  type = number
  default = 1
}
variable "instance_types" {
  description = "Instance types"
  type        = list(string)
  default     = ["t2.micro", "t3.micro", "t3a.micro"]
}
variable "allowed_region" {
  description = "regions available"
  type=set(string)
  default=["us-east-1","ap-south-1"]
}
variable "tags" {
  description = "tags for instance"
  type        = map(string)
  default = {
    Name        = "dev-instance"
    Environment = "dev"

  }
}
variable "s3_tags" {
  description = "tags for s3 bucket"
  type        = map(string)
  default = {
    Name        = "dev-s3-bucket"
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

variable "bucket_names" {
  type = list(string)
  default = ["unique-mybucket-name-1234560", "unique-mybucket-name-6543211"]
}

variable "bucket_names_set" {
type=set(string)
default=["unique-mybucket-name-11223340","unique-mybucket-name-44332211"]
}

variable "ingress_rules"{
  type=list(object({
    from_port=number
    to_port=number
    protocol=string
    cidr_blocks=list(string)
    description=string
  }))
  default=[{
     from_port=80
    to_port=80
    protocol="tcp"
    cidr_blocks=["0.0.0.0/0"]
    description="Allow HTTP traffic"
  },
  {
    from_port=443
    to_port=443
    protocol="tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    description="Allow HTTPS traffic"
  }]
}