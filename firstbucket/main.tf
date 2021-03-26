provider "aws" {
    region = "eu-central-1"
    profile = "terrauser-terraform"
}

resource "aws_s3_bucket" "firstBucket" {
    bucket = "waleed-first-terra-bucket"
    acl = "private"
    force_destroy = true

    tags = {
        name = "waleed_terrabucket"
        environment = "Test"
    }

    versioning {
        enabled = false
   }
}

resource "aws_s3_bucket_object" "Object" {
    bucket = "waleed-first-terra-bucket"
    key = "CV.doc"
    source = "./cv.txt"
}