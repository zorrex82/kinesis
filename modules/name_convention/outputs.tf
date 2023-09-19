
output "custom_context" {
  value       = module.custom.context
  description = "Custom context for naming based on inputs passed. Context with variables from the `cloudposse/label/null` module. Does not consider services."
}

output "openco_context" {
  value       = local.openco_context
  description = "Custom context for naming based on inputs passed. Context with default Openco variables: `region` `component_name` `environment`. Does not consider services."
}

output "custom_context_id" {
  value       = module.custom.id
  description = "Custom context ID string for naming based on inputs passed. Does not consider services."
}