resource "azurerm_bastion_host" "azure-bastion" {
    for_each = var.bastion
  name = each.value.bastion_name
  resource_group_name = each.value.rg_name
  location = each.value.location

  ip_configuration {
    name = "Subhasish-bastion"
    public_ip_address_id = data.azurerm_public_ip.azure-public[each.key].id
    subnet_id = data.azurerm_subnet.azure-subnet[each.key].id
  }
}