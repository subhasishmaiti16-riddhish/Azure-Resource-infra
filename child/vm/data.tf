data "azurerm_network_interface" "azure-nic" {
  for_each            = var.vm
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}

# data "azurerm_public_ip" "azure-public" {
#   for_each            = var.vm
#   name                = each.value.public_name
#   resource_group_name = each.value.rg_name

# }
