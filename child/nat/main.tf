resource "azurerm_nat_gateway" "azure-nat" {
  for_each                = var.nat
  name                    = each.value.nat_name
  location                = each.value.location
  resource_group_name     = each.value.rg_name
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10
  zones                   = ["1"]
}
