resource "azurerm_traffic_manager_profile" "traffic_manager_profile" {
  name                = format("traf-%s-%s", var.environment,var.application_name)
  resource_group_name = azurerm_resource_group.rg_subscription_bzunit_env_region["pri"].name

  traffic_routing_method = "Priority"

  dns_config {
    relative_name = format("dnsz-%s-%s", var.environment,var.application_name)
    ttl           = 100
  }

  monitor_config {
    protocol                     = "http"
    port                         = 80
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }

  tags     = {
      "business_unit" = var.business_unit
  }
}

resource "azurerm_traffic_manager_endpoint" "traffic_manager_endpoint" {
    for_each = var.dr_regions
    name                = format("trafendpt-%s-%s-%s", each.key, var.environment,var.application_name)
    resource_group_name = azurerm_resource_group.rg_subscription_bzunit_env_region["pri"].name
    profile_name        = azurerm_traffic_manager_profile.traffic_manager_profile.name
    type                = "azureEndpoints"
    weight              = 100
    target_resource_id  = azurerm_app_service.appsvc-subscription-bzunit-env-region[each.key].id
}