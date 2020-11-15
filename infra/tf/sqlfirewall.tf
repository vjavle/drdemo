resource "azurerm_sql_firewall_rule" "primary-sql_firewall_rule" {
    for_each = var.dr_regions
    name = format("sqlfw-%s-%s-%s", each.key, var.environment,var.application_name)
    resource_group_name = format("rg-%s-%s-%s", each.key, var.environment,var.application_name)
    server_name = format("sql-%s-%s-%s", each.key, var.environment,var.application_name)
    start_ip_address = var.start_ip_address
    end_ip_address = var.end_ip_address
}