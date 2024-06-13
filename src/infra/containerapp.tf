// # Juice Shop container resources in Azure

// Container App
resource "azurerm_log_analytics_workspace" "logs" {
  name                = "${local.workspace}-logs"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_container_app_environment" "environment" {
  name                       = "${local.workspace}-containerenv"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.logs.id
}

// Container App
resource "azurerm_container_app" "app" {
  name                         = "${local.workspace}-containerapp"
  container_app_environment_id = azurerm_container_app_environment.environment.id
  resource_group_name          = azurerm_resource_group.rg.name
  revision_mode                = "Single"

  template {
    container {
      name   = "${local.workspace}containerapp"
      image  = "bkimminich/juice-shop:latest"
      cpu    = 0.5
      memory = "1Gi"
    }
  }

  ingress {
    external_enabled = true
    target_port      = 3000
    traffic_weight {
      percentage = 100
      latest_revision = true
    }
    ip_security_restriction {
      name = "Ryan only"
      action = "Allow"
      ip_address_range = "191.96.0.0/16"
    }
  }
}
