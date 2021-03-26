


module "rds-module" {

  source                = "../../modules/rds"
  public-key-path       = "../../modules/rds/central-eu.pem"
  region                = "eu-central-1"
  profiles              = "terrauser-terraform"
  instance_type         = "t2.micro"
  vpc_cidr_block        = "10.0.0.0/16"
  public_subnet1a_cidr  = "10.0.1.0/24"
  public_subnet1b_cidr  = "10.0.2.0/24"
  private_subnet1a_cidr = "10.0.3.0/24"
  private_subnet1b_cidr = "10.0.4.0/24"
  rds_instance          = "db.t2.micro"
  vpc_id                = module.rds-module.vpc_id
  rds_endpoint          = module.rds-module.rds_endpoint


}