provider "aws" {
    region = var.region
    profile = "terrauser-terraform"
}




resource "aws_instance" "web" {
    ami = var.ami
    instance_type = var.instance_type
    availability_zone = var.availability_zone
    vpc_security_group_ids = [ aws_security_group.websg.id ]
    count = 2

    tags = {
        Name = "myweb-[count.index]"
    }
}

resource "aws_db_instance" "db" {
    instance_class = var.instance_class
    engine = var.engine
    engine_version = var.engine_version
    identifier = "mydb"
    name = "mydb"
    username = "admin"
    password = "admin123"
    allocated_storage = 20
    storage_type = "gp2"
    availability_zone = var.availability_zone
    skip_final_snapshot = true
    vpc_security_group_ids = [ aws_security_group.dbsg.id ]
}


resource "aws_security_group" "websg" {
    name = "Allow HTTP-HTTPS"

    dynamic "ingress" {
        iterator = port
        for_each = var.ingressrule
        content {
            cidr_blocks = ["0.0.0.0/0"]
            from_port = port.value
            to_port = port.value
            protocol = "tcp"
        }
    }

 dynamic "egress" {
        iterator = port
        for_each = var.egressrule
        content {
            cidr_blocks = ["0.0.0.0/0"]
            from_port = port.value
            to_port = port.value
            protocol = "tcp"
        }
    }
  
}


resource "aws_security_group" "dbsg" {
    name = "Allow mysql only"

    dynamic "ingress" {
        iterator = port
        for_each = var.dbingress
        content {
            cidr_blocks = ["0.0.0.0/0"]
            from_port = port.value
            to_port = port.value
            protocol = "tcp"
        }
    }

 dynamic "egress" {
        iterator = port
        for_each = var.dbegress
        content {
            cidr_blocks = ["0.0.0.0/0"]
            from_port = port.value
            to_port = port.value
            protocol = "tcp"
        }
    }
  
}