variable "project_name" {
  default = "hello Mamata"
}
variable "default_tags" {
  default = {
    company = "mamata"
    project = "terraform-learning"
  }
}
variable "project_tags" {
  default = {
    environment = "dev"
    owner       = "piyush"
  }
}
variable "bucket_name" {
  default = "Hellomamatathisismyfirst BUCKET withterraformwithpiyush!!!"
}
variable "allwed_ports" {
  default = "80,443,8080,3306"
}
variable "instance_sizes" {
  default = {
    dev  = "t2.micro"
    qa   = "t2.medium"
    prod = "t2.large"
  }
}
variable "environment" {
  default = "dev"
}

variable "instance_type" {
  default = "t3.micro"
  validation {
    condition     = length(var.instance_type) >= 7 && length(var.instance_type) <= 20
    error_message = "instance type must be between 7 and 20 char"
  }
  validation {
    condition     = can(regex("^t[2-3]\\.", var.instance_type))
    error_message = "instance type should start with t2 or t3"
  }
}
variable "backup_name" {
  default = "daily_backup"
  validation {
    condition     = endswith(var.backup_name, "_backup")
    error_message = "backup name must end with _backup"
  }
}

variable "credentials" {
  default = {
    username = "admin"
    password = "Admin@123"
  }
  sensitive = true
}

variable "user_locations" {
  default = ["us-east-1", "us-west-2", "eu-west-1", "us-east-1"]

}
variable "default_location" {
  default = ["ap-south-1"]

}
variable "monthly_costs" {
  default = [100, 200, -300, 150]
}

variable "bucket_myname" {
  default = "my-first-bucket-of-terraform-project-mamata"
}
variable "primary_region" {
  default = "ap-south-1"
}
variable "secondary_region" {
  default = "us-east-1"
}
variable "primary_vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "secondary_vpc_cidr" {
  default = "10.1.0.0/16"
}
variable "primary_key_name" {
  description = "Name of the SSH key pair for Primary VPC instance (us-east-1)"
  type        = string
  default     = "vpc-peering-demo"
}

variable "secondary_key_name" {
  description = "Name of the SSH key pair for Secondary VPC instance (us-west-2)"
  type        = string
  default     = "vpc-peering-demo"
}
variable "primary_subnet_cidr" {
  default = "10.0.1.0/24"
}
variable "secondary_subnet_cidr" {
  default = "10.1.1.0/24"
}
