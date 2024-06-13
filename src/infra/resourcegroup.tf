// # Juice Shop core resources in Azure

resource "azurerm_resource_group" "rg" {
  name     = "${local.workspace}-rg"
  location = var.location
}
