provider "aws" {
    region = "eu-central-1"
    profile = "terrauser-terraform"
}


resource "aws_db_instance" "mydb" {
    name = "mydb"
    identifier = "my-first-rds"
    instance_class = "db.t2.micro"
    engine = "mysql"
    engine_version = "10.2.1"
    username = "admin"
    password = "admin123"
    skip_final_snapshot = true
    port = 3306
    allocated_storage = 20
  
}