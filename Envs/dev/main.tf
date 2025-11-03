module "rgs" {
  source      = "../../Modules/AZ_RG"
  rg_names    = var.rgs
  common_tags = local.common_tags
}
module "vnets" {
  depends_on = [module.rgs]

  source      = "../../Modules/AZ_networing"
  vnet_names  = var.vnets
  common_tags = local.common_tags

}

module "pip" {
  depends_on = [module.rgs]

  source      = "../../Modules/AZ_PIP"
  public_ips  = var.pips
  common_tags = local.common_tags

}

module "vms" {
  source     = "../../Modules/AZ_Compute"
  depends_on = [module.vnets, module.pip]
  vm_names   = var.vms
}
