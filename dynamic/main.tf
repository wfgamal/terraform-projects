provider "aws" {
    region = "eu-central-1"
    profile = "terrauser-terraform"
}

variable "ingressrules" {
    type = list(number)
    default = [80,443]
}

variable "egressrules" {
    type = list(number)
    default = [80,443,8080,3306]
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

    dynamic "ingress" {
        iterator = port
        for_each = var.ingressrules
        content {
        cidr_blocks = [ "0.0.0.0/0" ]
        from_port = port.value
        to_port = port.value
        protocol = "tcp"
        }
    }

    dynamic "egress" {
        iterator = port
        for_each = var.egressrules
        content {
        cidr_blocks = [ "0.0.0.0/0" ]
        from_port = port.value
        to_port = port.value
        protocol = "tcp"
        }
    }
}
    
  