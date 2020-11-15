resource "azurerm_sql_database" "sql-database" {
    for_each = var.dr_regions
    name = format("sqldb-%s-%s-%s", each.key, var.environment,var.application_name)
    resource_group_name = azurerm_resource_group.rg_subscription_bzunit_env_region[each.key].name
    location = each.value
    server_name = azurerm_sql_server.sql_subscription_bzunit_env_region[each.key].name
    requested_service_objective_name = "Basic"
}