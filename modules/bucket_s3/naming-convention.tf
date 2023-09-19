module "this" {
  source      = "../name_convention"
  environment = var.environment
  project     = var.project
  region      = var.region
  company     = var.company
}
