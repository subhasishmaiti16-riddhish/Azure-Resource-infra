resource "azurerm_network_security_group" "nsgs" {
  for_each = var.vm

  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_network_interface_security_group_association" "nsg-nic-associations" {
  for_each = var.vm

  network_interface_id      = data.azurerm_network_interface.azure-nic[each.key].id
  network_security_group_id = azurerm_network_security_group.nsgs[each.key].id
}



resource "azurerm_linux_virtual_machine" "azure-vm" {
  for_each            = var.vm
  name                = each.value.vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = "Standard_D2ls_v5"
  admin_username      = "adminuser"
  admin_password      = "Subhasish12#"
  network_interface_ids = [
    data.azurerm_network_interface.azure-nic[each.key].id,
  ]
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
