data "azurerm_storage_account" "prod" {
  name                = "iopsignlandingsa"
  resource_group_name = "io-p-sign-integration-rg"
}

data "azurerm_cdn_profile" "prod" {
  name                = "io-p-sign-landing-cdn-profile"
  resource_group_name = "io-p-sign-integration-rg"
}

# Data source still not implemented
# https://github.com/hashicorp/terraform-provider-azurerm/issues/8243
# data "azurerm_cdn_endpoint" "prod" {
#   name                = "io-p-sign-landing-cdn-profile/io-p-sign-landing-cdn-endpoint"
#   profile_name        = "io-p-sign-landing-cdn-profile"
#   resource_group_name = "io-p-sign-integration-rg"
# }
