data "aws_ami" "ami" {
  owners      = ["973714476881"]
  name_regex  = "RHEL-9-DevOps-Practice"
  most_recent = true

}

data "aws_security_group" "instance_sg" {
  name = "allow-all"
}

variable "components" {
  default = {
    frontend = {
      name          = "frontend"
      instance_type = "t2.micro"
    }
    backend = {
      name          = "backend"
      instance_type = "t2.micro"
    }
  }
}

resource "aws_instance" "instance" {
  for_each               = var.components
  instance_type          = each.value["instance_type"]
  ami                    = data.aws_ami.ami.id
  vpc_security_group_ids = [data.aws_security_group.instance_sg.id]

  tags = {
    name = each.value["name"]
  }
}

resource "aws_route53_record" "records" {
  for_each = var.components
  zone_id  = "Z02795351QOID794T5B10"
  name     = "${each.value["name"]}-dev.meghadevops.site"
  type     = "A"
  ttl      = 30
  records  = [aws_instance.instance[each.value["name"]].private_ip]
}

