terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "805cc58a-b2c1-4e91-97ec-b0ba35c3dc96"
}



# terraform {
#   required_providers {
#     azurerm = {
#       source = "hashicorp/azurerm"
#       version = "4.37.0"
#     }
#   }
# }

# provider "azurerm" {
#   features {
#     # key_vault {
#     #   purge_soft_delete_on_destroy    = true
#     #   recover_soft_deleted_key_vaults = true
#     # }
#   }
#   subscription_id = "805cc58a-b2c1-4e91-97ec-b0ba35c3dc96"
# }