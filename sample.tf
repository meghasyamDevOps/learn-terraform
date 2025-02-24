resource "aws_instance" "frontend" {
  ami           = data.aws_ami.ami.id
  instance_type = "t3.micro"

  tags = {
    Name = "frontend"
  }
}

data "aws_ami" "ami" {
  owners      = ["973714476881"]
  name_regex  = "RHEL-9-DevOps-Practice"
  most_recent = true

  /*filter {
    name   = "RHEL-9-DevOps-Practice"
    values = ["ami-09c813fb71547fc4f"]
  }*/
}