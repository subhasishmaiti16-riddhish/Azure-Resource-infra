resource "azurerm_public_ip" "azure-public" {
  for_each            = var.public
  name                = each.value.public_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  allocation_method   = "Static"
}
