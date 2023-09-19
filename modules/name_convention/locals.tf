locals {
  delimiter = "."

  default_context = {
    enabled             = true
    environment         = var.region
    name                = null
    stage               = null
    attributes          = []
    namespace           = null
    delimiter           = local.delimiter
    labels_as_tags      = ["unset"]
    additional_tag_map  = {}
    regex_replace_chars = null
    label_order         = ["stage", "namespace", "tenant", "name"]
    id_length_limit     = null
    label_key_case      = "title"
    label_value_case    = "none"
    descriptor_formats = {
      stack = {
        labels = ["stage", "namespace", "tenant", "environment"]
        format = "%v-%v-%v-%v"
      }
    }
  }

  actual_context = merge(local.default_context, { tags = {}, stage = var.environment, namespace = var.company })

  openco_context = {
    region      = module.custom.context.environment
    environment = module.custom.context.stage
    company     = module.custom.context.namespace
    project     = module.custom.context.tenant
  }
}