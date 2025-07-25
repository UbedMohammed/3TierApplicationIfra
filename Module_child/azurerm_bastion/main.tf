data "azurerm_subnet" "internal" {
  for_each             = var.bastion
  name                 = each.value.subnetname
  virtual_network_name = each.value.vnetname
  resource_group_name  = each.value.rgname

}

data "azurerm_public_ip" "bastion_pip" {
  for_each            = var.bastion
  name                = each.value.public_ip_name
  resource_group_name = each.value.rgname

}
resource "azurerm_bastion_host" "bastion" {
  for_each            = var.bastion
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.rgname

  ip_configuration {
    name                 = each.value.bastion_ip
    subnet_id            = data.azurerm_subnet.internal[each.key].id
    public_ip_address_id = data.azurerm_public_ip.bastion_pip[each.key].id
  }
#  lifecycle {
#     prevent_destroy = true
#   } 
}
