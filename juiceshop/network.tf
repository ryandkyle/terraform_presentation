// # Juice Shop network resources in Azure

// VNET
resource "azurerm_virtual_network" "vnet" {
    name                = "${var.prefix}-vnet"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    address_space       = ["10.1.0.0/16"]
}

// Firewall subnet
module "gateway_subnet" {
  source = "../modules/subnet"

  resource_group_name  = azurerm_resource_group.rg.name
  prefix               = var.prefix
  virtual_network_name = azurerm_virtual_network.vnet.name
  subnet_postfix       = "gateway"
}

// frontend subnet
resource "azurerm_subnet" "frontend" {
    name                 = "${var.prefix}-web-subnet"
    resource_group_name  = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes     = ["10.1.0.0/24"]

    delegation {
        name = "delegation"

        service_delegation {
            name    = "Microsoft.ContainerInstance/containerGroups"
            actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
        }
    }
}

// backend subnet
resource "azurerm_subnet" "backend" {
    name                 = "backend"
    resource_group_name  = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes     = ["10.1.2.0/24"]
}
