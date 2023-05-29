resource "azuread_application" "environment_prod" {
  display_name = "${local.app_name}-prod"
}

resource "azuread_service_principal" "environment_prod" {
  application_id = azuread_application.environment_prod.application_id
}

resource "azuread_application_federated_identity_credential" "environment_prod" {
  application_object_id = azuread_application.environment_prod.object_id
  display_name          = "github-federated"
  description           = "github-federated"
  audiences             = ["api://AzureADTokenExchange"]
  issuer                = "https://token.actions.githubusercontent.com"
  subject               = "repo:${var.github.org}/${var.github.repository}:environment:${var.env}-prod"
}

resource "azurerm_role_assignment" "environment_prod_subscription" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Reader"
  principal_id         = azuread_service_principal.environment_prod.object_id
}

resource "azurerm_role_assignment" "environment_prod_storage_account" {
  scope                = data.azurerm_storage_account.prod.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.environment_prod.object_id
}

resource "azurerm_role_assignment" "environment_prod_cdn_profile" {
  scope                = data.azurerm_cdn_profile.prod.id
  role_definition_name = "CDN Profile Contributor"
  principal_id         = azuread_service_principal.environment_prod.object_id
}

output "azure_environment_prod" {
  value = {
    app_name       = "${local.app_name}-prod"
    client_id      = azuread_service_principal.environment_prod.application_id
    application_id = azuread_service_principal.environment_prod.application_id
    object_id      = azuread_service_principal.environment_prod.object_id
  }
}
