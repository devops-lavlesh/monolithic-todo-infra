resource "azurerm_public_ip" "pips" {
  for_each = var.public_ips

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku

  #  Conditional expression for domain name
  domain_name_label = try(each.value.dns_settings.domain_name_label, null)

  #  Merge optional tags
  tags = merge(var.common_tags, try(each.value.tags, {}))
}