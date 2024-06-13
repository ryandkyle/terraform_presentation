// Subnet module resources

resource "azurerm_subnet" "subnet" {
  name                 = "${var.workspace}-${var.subnet_postfix}-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.1.4.0/24"]
}
