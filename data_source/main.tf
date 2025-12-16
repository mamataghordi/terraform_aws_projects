data "aws_vpc" "default_vpc" {
  filter {
    name   = "tag:Name"
    values = ["default"]
  }
}

data "aws_subnet" "default_subnets" {
  filter {
    name   = "tag:Name"
    values = ["subneta"]
  }
  vpc_id = data.aws_vpc.default_vpc.id
}
data "aws_ami" "linux2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "my_instance" {
  ami           = data.aws_ami.linux2.id
  instance_type = "t3.micro"
  subnet_id     = data.aws_subnet.default_subnets.id
  tags          = var.default_tags
}
