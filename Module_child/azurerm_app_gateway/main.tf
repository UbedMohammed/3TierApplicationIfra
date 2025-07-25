# data "azurerm_subnet" "subnet_internal" {
#     for_each = var.appgateway
#   name                 = each.value.subnetname
#   virtual_network_name = "production"
#   resource_group_name  = "networking"
# }

# output "subnet_id" {
#   value = data.azurerm_subnet.example.id
# }
# resource "azurerm_application_gateway" "appgateway" {
#     for_each = var.appgateway 
#   name                = each.value.appgatwayname
#   resource_group_name = each.value.rgname
#   location            = each.value.location

#   sku {
#     name     = "Standard_v2"
#     tier     = "Standard_v2"
#     capacity = 2
#   }

# # gatway_ip_configuration ke liye data_block laga hai
#   gateway_ip_configuration {
#     name      = "my-gateway-ip-configuration"
#     subnet_id = azurerm_subnet.example.id
#   }

#   frontend_port {
#     name = "feapp_port"
#     port = 80
#   }

#   frontend_ip_configuration {
#     name                 = "fe_ip"
#     public_ip_address_id = data_block
#   }

#   backend_address_pool {
#     name = local.backend_address_pool_name
#   }

#   backend_http_settings {
#     name                  = local.http_setting_name
#     cookie_based_affinity = "Disabled"
#     path                  = "/path1/"
#     port                  = 80
#     protocol              = "Http"
#     request_timeout       = 60
#   }

#   http_listener {
#     name                           = local.listener_name
#     frontend_ip_configuration_name = local.frontend_ip_configuration_name
#     frontend_port_name             = local.frontend_port_name
#     protocol                       = "Http"
#   }

#   request_routing_rule {
#     name                       = local.request_routing_rule_name
#     priority                   = 9
#     rule_type                  = "Basic"
#     http_listener_name         = local.listener_name
#     backend_address_pool_name  = local.backend_address_pool_name
#     backend_http_settings_name = local.http_setting_name
#   }
# }
# Copy
# Argument Reference