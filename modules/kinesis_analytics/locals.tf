locals {
  name               = "${module.this.custom_context_id}.${var.name}"
  name_role          = "${module.this.custom_context_id}.role.${var.name}"
  name_policy        = "${module.this.custom_context_id}.policy.${var.name}"
  name_cloudwatch_lg = "${module.this.custom_context_id}.${var.name}.clg"
  name_cloudwatch_ls = "${module.this.custom_context_id}.${var.name}.cls"
  schema             = jsondecode(file("${var.table_config}"))
}