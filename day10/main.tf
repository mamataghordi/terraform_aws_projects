resource "aws_instance" "example" {
  ami           = "ami-0d176f79571d18a8f"
  instance_type = var.instance_types[1]
count = var.instance_count
  tags = var.tags
}
resource "aws_security_group" "example" {
  name   = "sg"
 
#dynamic bock for ingress rules
 dynamic "ingress" {
  for_each=var.ingress_rules
  content{
      from_port=ingress.value.from_port
      to_port=ingress.value.to_port
      protocol=ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
 }
  # egress  = []
}
locals {
  all_intances_ids=aws_instance.example[*].id
}

output "instance_ids" {
  value=local.all_intances_ids
} 