terraform {
  cloud {
    organization = "ryan_devops"

    workspaces {
      name = "juiceshop-dev"
    }
  }
}
