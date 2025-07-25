module "rg" {
  source = "../../Module_child/azurerm_resource_group"
  rg     = var.rg
}

module "stg" {
  depends_on = [module.rg]
  source     = "../../Module_child/azurerm_storage_account"
  stg        = var.stg
}

module "vnet" {
  depends_on = [module.rg]
  source     = "../../Module_child/azurerm_vnet_subnet"
  vnet       = var.vnet
}

module "bastion" {
  depends_on = [module.rg, module.vnet, module.pip]
  source     = "../../Module_child/azurerm_bastion"
  bastion    = var.bastion
}
module "pip" {
  depends_on = [module.rg, module.vnet]
  source     = "../../Module_child/azurerm_pip"
  pips       = var.pips
}

module "vm" {
  depends_on = [module.rg, module.vnet]
  source     = "../../Module_child/azurerm_vm_nic"
  vm         = var.vm
}

module "sqlserver1" {
  depends_on = [module.rg]
  source     = "../../Module_child/azurerm_sqlserver_sqldatabase"
  sqlserver1 = var.sqlserver1
}

module "kv" {
  depends_on = [module.rg]
  source     = "../../Module_child/azurerm_keyvalut"
  key_vaults = var.key_vaults
}

# # # module "lb" {
# # #   depends_on = [module.pip, module.vnet, module.rg]
# # #   source     = "../../Module_child/azurerm_load_balancer"
# # #   lb         = var.lb
# # # }

# # # module "appgateway" {
# # #   depends_on = [ module.rg, module.vnet, module.subnet_id ]
# # #   source = "../../Module_child/azurerm_vnet_subnet"
# # #   appgateway = var.appgateway
# # # }


