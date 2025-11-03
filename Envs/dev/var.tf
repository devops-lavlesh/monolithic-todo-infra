
# this  is the variable block contains variable definitions for resource groups
variable "rgs" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}

#  this  is the variable block contains variable definitions for virtual networks
variable "vnets" {
  type = map(object(
    {
      name                = string
      resource_group_name = string
      location            = string
      address_space       = list(string)
      tags                = optional(map(string))
      subnets = optional(map(object(
        {
          name             = string
          address_prefixes = list(string)
        }
      )))
    }
  ))
}
#  this  is the variable block contains variable definitions for public IP addresses

variable "pips" {
  type = map(object({
    name              = string
    location          = string
    rg_name           = string
    allocation_method = string
    sku               = optional(string, "Standard") # optional attribute
    dns_settings = optional(object({                 # optional nested object
      domain_name_label = string
    }))
    tags = optional(map(string), {}) # optional map
  }))
}

variable "vms" {
  type = map(object({
    nic_name            = string
    location            = string
    resource_group_name = string
    vnet_name           = string
    subnet_name         = string
    pip_name            = string
    vm_name             = string
    admin_username      = string
    admin_password      = string
    size                = string
    source_image_reference = object({
        publisher = string
        offer     = string
        sku       = string
        version   = string
    })
  }))
}
