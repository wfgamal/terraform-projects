
variable "region" {
  default = "eu-central-1"
}

variable "ingressrule" {
  type    = list(number)
  default = [80, 443]
}

variable "egressrule" {
  type    = list(number)
  default = [80, 443, 3306, 8080]
}

variable "dbingress" {
  type    = list(number)
  default = [3306]
}

variable "dbegress" {
  type    = list(number)
  default = [3306]
}

variable "AMIS" {

  type = map
  default = {
    eu-central-1 = "ami-02f9ea74050d6f812"
    us-east-1 = "ami-0915bcb5fa77e4892"
  }

  
}

variable "instance_type" {
  default = "t2.micro"
}

variable "azs" {
  type    = list(string)
  default = ["eu-central-1a", "eu-central-1b"]
}


variable "instance_class" {
  default = "db.t2.micro"
}
variable "engine" {
  default = "mysql"
}
variable "engine_version" {
  default = "5.7"
}

