data "aws_ami" "ami" {
  owners      = ["973714476881"]
  name_regex  = "RHEL-9-DevOps-Practice"
  most_recent = true

}

data "aws_security_group" "instance_sg" {
  name = "allow-all"
}

resource "aws_instance" "instance" {
  instance_type = "t2.micro"
  ami = data.aws_ami.ami.id
  vpc_security_group_ids = [data.aws_security_group.instance_sg.id]

  tags = {
    name = "practice"
  }
}

resource "aws_route53_record" "records" {
  zone_id = "Z02795351QOID794T5B10"
  name    = "$practice-dev.meghadevops.site"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance.private_ip]
}

