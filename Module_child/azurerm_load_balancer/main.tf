resource "azurerm_lb" "example" {
    for_each = var.lb
  name                = each.value.lbname
  location            = each.value.location
  resource_group_name = each.value.rgname 

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.example.id
  }
}