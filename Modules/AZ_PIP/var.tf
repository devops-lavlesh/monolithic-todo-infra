variable "public_ips" {
  type = map(object({
    name              = string
    location          = string
    rg_name           = string
    allocation_method = string
    sku               = optional(string, "Standard")          # optional attribute
    dns_settings = optional(object({                         # optional nested object
      domain_name_label = string
    }))
    tags = optional(map(string), {})                          # optional map
  }))
}
variable "common_tags" {
  type = map(string)
}