module "juiceshop" {
  source = "../../modules/juiceshopapp"

  project         = var.project
  location        = var.location
  environment     = var.environment
  subscription_id = var.subscription_id
}
