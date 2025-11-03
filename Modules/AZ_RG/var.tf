variable "rg_names" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}
variable "common_tags" {
  type = map(string)
}