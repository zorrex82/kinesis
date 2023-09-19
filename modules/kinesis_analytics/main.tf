resource "aws_kinesisanalyticsv2_application" "this" {
  name                   = local.name
  runtime_environment    = var.runtime_environment
  service_execution_role = aws_iam_role.kinesis_analytics_service_role.arn

  application_configuration {
    application_code_configuration {
      code_content {
        s3_content_location {
          bucket_arn = var.s3_content_location.bucket_arn
          file_key   = var.s3_content_location.file_key
        }
      }

      code_content_type = var.code_content_type
    }

    environment_properties {
      dynamic "property_group" {
        for_each = var.property_group
        content {
          property_group_id = property_group.value.property_group_id
          property_map      = property_group.value.property_map
        }
      }
    }


    flink_application_configuration {
      checkpoint_configuration {
        configuration_type = var.checkpoint_configuration.configuration_type
      }
      monitoring_configuration {
        configuration_type = var.monitoring_configuration.configuration_type
        log_level          = var.monitoring_configuration.log_level
        metrics_level      = var.monitoring_configuration.metrics_level
      }
      parallelism_configuration {
        auto_scaling_enabled = var.parallelism_configuration.auto_scaling_enabled
        configuration_type   = var.parallelism_configuration.configuration_type
        parallelism          = var.parallelism_configuration.parallelism
        parallelism_per_kpu  = var.parallelism_configuration.parallelism_per_kpu
      }
    }
  }
  cloudwatch_logging_options {
    log_stream_arn = aws_cloudwatch_log_stream.this.arn
  }
}
