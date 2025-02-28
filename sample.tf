data "aws_ami" "ami" {
  owners      = ["973714476881"]
  name_regex  = "RHEL-9-DevOps-Practice"
  most_recent = true

}

data "aws_security_group" "instance_sg" {
  name = "allow-all"
}

resource "aws_instance" "instance" {
  ami                    = data.aws_ami.ami.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_security_group.instance_sg.id]

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "records" {
  zone_id = "Z02795351QOID794T5B10"
  name    = "frontend-dev.meghadevops.site"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance.private_ip]
}

/*
variable "components" {
  default = {
    forntend = {
      name          = "frontend"
      instance_type = "t3.micro"
    }
    catalogue = {
      name          = "catalogue"
      instance_type = "t3.micro"
    }
    cart = {
      name          = "cart"
      instance_type = "t3.micro"
    }
    shipping = {
      name          = "shipping"
      instance_type = "t3.micro"
    }
    user = {
      name          = "user"
      instance_type = "t3.micro"
    }
    payment = {
      name          = "payment"
      instance_type = "t3.micro"
    }
    dispatch = {
      name          = "dispatch"
      instance_type = "t3.micro"
    }
    mongodb = {
      name          = "mongodb"
      instance_type = "t3.small"
    }
    mysql = {
      name          = "mysql"
      instance_type = "t3.small"
    }
    redis = {
      name          = "redis"
      instance_type = "t3.small"
    }
    rabbitmq = {
      name          = "rabbitmq"
      instance_type = "t3.small"
    }
  }
}*/
