# resource "azurerm_network_interface" "nic" {
#   name                = "nic1"
#   location            = "Central India"
#   resource_group_name = "ubed"
#     ip_configuration {
#         name                          = "testconfiguration1"
#         subnet_id                     = data.azurerm_subnet.internal[each.key].id
#         private_ip_address_allocation = "Dynamic"
#     }
# }