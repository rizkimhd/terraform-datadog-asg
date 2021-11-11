output "timeboard_title" {
  value       = join(",", datadog_dashboard.asg.*.title)
  description = "The title of datadog timeboard for ASG"
}

