resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name        = "${var.environment}-my_vpc"
    Environment = var.environment
  }
}
resource "aws_instance" "my_instance" {
  ami                         = "ami-0d176f79571d18a8f"
  instance_type               = var.instance_types[1]
  monitoring                  = var.monitoring_enable
  associate_public_ip_address = var.associate_public_ip_address
  count                       = var.config.instance_count
  tags                        = var.tags
}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"


  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.cidr_block[0]
  from_port         = var.ingress_values[0]
  ip_protocol       = var.ingress_values[1]
  to_port           = var.ingress_values[2]
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
