resource "github_repository_environment" "github_repository_environment_prod" {
  environment = "${var.env}"
  repository  = var.github.repository
  deployment_branch_policy {
    protected_branches     = false
    custom_branch_policies = true
  }
}

#tfsec:ignore:github-actions-no-plain-text-action-secrets # not real secret
resource "github_actions_environment_secret" "azure_prod_tenant_id" {
  repository      = var.github.repository
  environment     = github_repository_environment.github_repository_environment_prod.environment
  secret_name     = "AZURE_TENANT_ID"
  plaintext_value = data.azurerm_client_config.current.tenant_id
}

#tfsec:ignore:github-actions-no-plain-text-action-secrets # not real secret
resource "github_actions_environment_secret" "azure_prod_subscription_id" {
  repository      = var.github.repository
  environment     = github_repository_environment.github_repository_environment_prod.environment
  secret_name     = "AZURE_SUBSCRIPTION_ID"
  plaintext_value = data.azurerm_subscription.current.subscription_id
}

#tfsec:ignore:github-actions-no-plain-text-action-secrets # not real secret
resource "github_actions_environment_secret" "azure_prod_client_id" {
  repository      = var.github.repository
  environment     = github_repository_environment.github_repository_environment_prod.environment
  secret_name     = "AZURE_CLIENT_ID"
  plaintext_value = azuread_service_principal.environment_prod.application_id
}
