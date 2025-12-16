resource "aws_instance" "my_instance"{
  ami="ami-0d176f79571d18a8f"
  instance_type = var.instance_types[1]
  region = tolist(var.allowed_region)[0]
  tags = var.tags
  lifecycle {
    create_before_destroy=true
  }
}
