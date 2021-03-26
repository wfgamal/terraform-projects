


module "custom-vpc" {

  source = "../modules/vpc"

}

module "custom-asg" {

  source = "../modules/asg"

}