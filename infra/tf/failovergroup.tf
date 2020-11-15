resource "azurerm_sql_failover_group" "sql_failover_group" {
    name                = format("sqlfailovergroup-%s-%s", var.environment,var.application_name)
    resource_group_name = azurerm_resource_group.rg_subscription_bzunit_env_region["pri"].name
    server_name         = azurerm_sql_server.sql_subscription_bzunit_env_region["pri"].name
    databases           = [azurerm_sql_database.sql-database["pri"].id]
    partner_servers {
        id = azurerm_sql_server.sql_subscription_bzunit_env_region["sec"].id
    }
    read_write_endpoint_failover_policy {
    mode = "Manual"
    }
    tags     = {
        "business_unit" = var.business_unit
    }
}
