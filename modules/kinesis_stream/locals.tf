locals {
  name                   = "${module.this.custom_context_id}.${var.name}"
  name_role              = "${module.this.custom_context_id}.${var.name}.role"
  name_policy            = "${module.this.custom_context_id}.${var.name}.policy"
  name_cloudwatch_clg_s3 = "${module.this.custom_context_id}.${var.name}.clg.s3"
  name_cloudwatch_cls_s3 = "${module.this.custom_context_id}.${var.name}.cls.s3"
}