output "id" {
  description = "OCID of the alarm."
  value       = oci_monitoring_alarm.this.id
}

output "display_name" {
  description = "Display name of the alarm."
  value       = oci_monitoring_alarm.this.display_name
}

output "is_enabled" {
  description = "Whether the alarm is enabled."
  value       = oci_monitoring_alarm.this.is_enabled
}

output "state" {
  description = "Lifecycle state of the alarm."
  value       = oci_monitoring_alarm.this.state
}
