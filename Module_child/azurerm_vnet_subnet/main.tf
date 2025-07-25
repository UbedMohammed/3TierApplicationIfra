resource "azurerm_virtual_network" "main" {
    for_each = var.vnet 
  name                = each.value.vnetname
  address_space       = ["10.0.0.0/16"]
  location            = each.value.location
  resource_group_name = each.value.rgname 

dynamic "subnet" {
  for_each = each.value.subnets
  content {
    name = subnet.value.subnetname
    address_prefixes = subnet.value.address_prefixes
  }
}
}