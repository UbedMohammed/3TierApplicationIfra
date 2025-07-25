data "azurerm_subnet" "internal" {
  for_each = var.vm
  name                 = each.value.subnetname
  virtual_network_name = each.value.vnetname
  resource_group_name  = each.value.rgname
 
}

resource "azurerm_network_interface" "nic" {
    for_each = var.vm
  name                = each.value.nicname
  location            = each.value.niclocation
  resource_group_name = each.value.rgname

  ip_configuration {
    name                          = each.value.ipname
    subnet_id                     = data.azurerm_subnet.internal[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "vm" {
    for_each = var.vm
  name                  = each.value.vmname
  location              = each.value.location
  resource_group_name   = each.value.rgname
  network_interface_ids = [azurerm_network_interface.nic[each.key].id]
  vm_size               = each.value.vm_size

# #   Uncomment this line to delete the OS disk automatically when deleting the VM
#   delete_os_disk_on_termination = true

# #   Uncomment this line to delete the data disks automatically when deleting the VM
#   delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = each.value.diskname
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "admin123"
    admin_password = "Password@123456"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}