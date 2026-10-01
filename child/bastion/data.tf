data "azurerm_subnet" "azure-subnet" {
  for_each             = var.bastion
  name                 = each.value.subnet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
}

data "azurerm_public_ip" "azure-public" {
  for_each            = var.bastion
  name                = each.value.public_name
  resource_group_name = each.value.rg_name

}
