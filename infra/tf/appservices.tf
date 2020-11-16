resource "azurerm_app_service" "appsvc-subscription-bzunit-env-region" {
    for_each = var.dr_regions
    name                         = format("appplan-%s-%s-%s", each.key, var.environment,var.application_name)
    resource_group_name          = azurerm_resource_group.rg_subscription_bzunit_env_region[each.key].name
    location                     = each.value


    app_service_plan_id = azurerm_app_service_plan.appsvcplan-subscription-bzunit-env-region[each.key].id

    site_config {
        dotnet_framework_version = "v4.0"
        scm_type                 = "LocalGit"
    }

    connection_string {
        name  = "Database"
        type  = "SQLServer"
        value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
    }
}