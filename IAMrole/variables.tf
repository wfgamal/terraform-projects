
variable "region"{
    default = "eu-central-1"
}

variable "ingressrule" {
    type = list(number)
    default = [80,443]
}

variable "egressrule" {
  type = list(number)
  default = [80,443,3306,8080]
}

variable "dbingress" {
    type = list(number)
    default = [3306]
}

variable "dbegress" {
  type = list(number)
  default = [3306]
}

variable "ami" {
    default = "ami-0a6dc7529cd559185"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "azs" {
    type = list(string)
    default = ["eu-central-1a" , "eu-central-1b"]
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

