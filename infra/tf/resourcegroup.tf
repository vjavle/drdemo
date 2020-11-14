resource "azurerm_resource_group" "rg_subscription_bzunit_env_region" {
  name     = format("rg-%s-%s", var.environment,var.application_name)
  location = var.region
  tags     = {
      "business_unit" = var.business_unit
  }
}