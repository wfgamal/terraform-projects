module "rds-module" {

  source                = "../../modules/iam"
  region                = "eu-central-1"
  profiles              = "terrauser-terraform"
  


}