resource "azurerm_network_interface" "azure-nic" {
  for_each            = var.nic
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
  location            = each.value.location


  ip_configuration {
    name                          = "Subhasish"
    subnet_id                     = data.azurerm_subnet.azure-subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
  tags = { # Map
    environment = "preprod"
  }
}
