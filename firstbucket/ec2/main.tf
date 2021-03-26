provider "aws" {
    region = "eu-central-1"
    profile = "terrauser-terraform"
}

resource "aws_instance" "ec2" {
    ami = "ami-0a6dc7529cd559185"
    instance_type = "t2.micro"
    security_groups = [ "aws_security_group.web-sg.name" ]

    tags = {
        Name = "web1"
    }
}

resource "aws_eip" "elasticip" {
    instance = "aws_instance.ec2.id"
}

output "eip_output" {
    value = "aws_eip.elasticip.public_ip"
}

resource "aws_security_group" "web-sg" {
    name = "Allow HTTPS"

    ingress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "open HTTPS"
    from_port = 443
    ipv6_cidr_blocks = [ "value" ]
    prefix_list_ids = [ "value" ]
    protocol = "tcp"
    security_groups = [ "value" ]
    self = false
    to_port = 443
    } ]
  
  egress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "open HTTPS"
    from_port = 443
    ipv6_cidr_blocks = [ "value" ]
    prefix_list_ids = [ "value" ]
    protocol = "tcp"
    security_groups = [ "value" ]
    self = false
    to_port = 443
  } ]
}