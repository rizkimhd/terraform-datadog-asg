module "asg" {
  source         = "../../"
  product_domain = "BEI"
  cluster        = "beical-app"
  environment    = "production"
}
