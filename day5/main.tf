resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    Name        = "${var.environment}-my_vpc"
    Environment = var.environment
  }
}
resource "aws_instance" "my_instance" {
  ami           = "ami-0d176f79571d18a8f"
  instance_type = "t3.micro"

  tags = {
    Name        = local.vpc_name
    Environment = var.environment
  }
}