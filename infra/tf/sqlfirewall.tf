resource "azurerm_sql_firewall_rule" "primary-sql_firewall_rule" {
    for_each = var.dr_regions
    name = format("sqlfw-%s-%s-%s", each.key, var.environment,var.application_name)
    resource_group_name = azurerm_resource_group.rg_subscription_bzunit_env_region[each.key].name 
    server_name = azurerm_sql_server.sql_subscription_bzunit_env_region[each.key].name
    start_ip_address = var.start_ip_address
    end_ip_address = var.end_ip_address
}