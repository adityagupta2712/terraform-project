provider "aws" {
  region = "ap-southeast-1"
  profile = "terraform-adi" //update your user-profile for aws keys
}

module "vpc_module" {
  source = "./vpc_module"
}

module "elb_module" {
  source = "./elb_module"
  vpc_test_id = module.vpc_module.vpc_test_id
  public_subnet_id_1 = module.vpc_module.public_subnet_id_1
  public_subnet_id_2 = module.vpc_module.public_subnet_id_2
  ec2_name_1 = module.ec2_module.ec2_name_1
  ec2_name_2 = module.ec2_module.ec2_name_2
}

module "ec2_module" {
  source = "./ec2_module"
  vpc_test_id = module.vpc_module.vpc_test_id
  public_subnet_id_1 = module.vpc_module.public_subnet_id_1
  security_group_elb = module.elb_module.security_group_elb

}
module "db_module" {
  source = "./db_module"
  vpc_test_id = module.vpc_module.vpc_test_id
  private_subnet_id_1 = module.vpc_module.private_subnet_id_1
  private_subnet_id_2 = module.vpc_module.private_subnet_id_2
}
