resource "datadog_dashboard" "asg" {
  count = var.enabled ? 1 : 0

  title       = "${var.product_domain} - ${var.cluster} - ${var.environment} - ASG"
  description = "A generated timeboard for ASG"
  layout_type = "ordered"

  template_variable {
    default = var.cluster
    name    = "cluster"
    prefix  = "cluster"
  }

  template_variable {
    default = var.environment
    name    = "environment"
    prefix  = "environment"
  }

  widget {
    timeseries_definition {
      title = "Group Size"

      request {
        q            = "avg:aws.autoscaling.group_total_instances{$cluster, $environment} by {autoscaling_group}"
        display_type = "line"
      }

      request {
        q            = "avg:aws.autoscaling.group_max_size{$cluster, $environment} by {autoscaling_group}"
        display_type = "line"

        style {
          line_type = "dashed"
        }
      }

      request {
        q            = "avg:aws.autoscaling.group_min_size{$cluster, $environment} by {autoscaling_group}"
        display_type = "line"

        style {
          line_type = "dashed"
        }
      }

      request {
        q            = "avg:aws.autoscaling.group_desired_capacity{$cluster, $environment} by {autoscaling_group}"
        display_type = "line"

        style {
          line_type = "dashed"
        }
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Group Instances"

      request {
        q            = "avg:aws.autoscaling.group_pending_instances{$cluster, $environment} by {autoscaling_group}"
        display_type = "line"
      }

      request {
        q            = "avg:aws.autoscaling.group_standby_instances{$cluster, $environment} by {autoscaling_group}"
        display_type = "line"
      }

      request {
        q            = "avg:aws.autoscaling.group_terminating_instances{$cluster, $environment} by {autoscaling_group}"
        display_type = "line"
      }

      request {
        q            = "avg:aws.autoscaling.group_total_instances{$cluster, $environment} by {autoscaling_group}"
        display_type = "line"

        style {
          line_type = "dotted"
        }
      }
    }
  }
}

