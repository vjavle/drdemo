resource "azurerm_app_service_plan" "appsvcplan-subscription-bzunit-env-region" {
    for_each = var.dr_regions
    name                         = format("appsvcplan-%s-%s-%s", each.key, var.environment,var.application_name)
    resource_group_name          = azurerm_resource_group.rg_subscription_bzunit_env_region[each.key].name
    location                     = each.value

    sku {
    tier = "Standard"
    size = "S1"
    }
}