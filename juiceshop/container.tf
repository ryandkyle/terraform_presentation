// # Juice Shop container resources in Azure

// Container Instance
resource "azurerm_container_group" "container" {
    name                = "${var.prefix}-cg"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    os_type             = "Linux"
    ip_address_type     = "Private"
    subnet_ids          = [azurerm_subnet.frontend.id]

    container {
        name   = "${var.prefix}-container"
        image  = "bkimminich/juice-shop"
        cpu    = "1"
        memory = "2"

        ports {
            port     = 3000
            protocol = "TCP"
        }
    }
}
