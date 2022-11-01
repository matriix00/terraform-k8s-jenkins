module "network" {
  
  source = "/home/dev97/GraduationProject/infra/terraform/network"
  region_name = var.region_name
  subnet_cidrs = var.subnet_cidrs
  project_id = var.project_id
}