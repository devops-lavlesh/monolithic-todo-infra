variable "vnet_names" {
  type = map(object(
    {
      name                = string
      resource_group_name = string
      location            = string
      address_space       = list(string)
      tags                = optional(map(string))
      subnets = optional(map(object(
        {
          name           = string
          address_prefixes = list(string)
        }
      )))
    }
  ))
}
variable "common_tags" {
  type = map(string)
}
