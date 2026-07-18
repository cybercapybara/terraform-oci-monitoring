provider "oci" {}

module "alarm" {
  source = "../.."

  compartment_id = var.compartment_id
  display_name   = "example-high-cpu"
  namespace      = "oci_computeagent"
  query          = "CpuUtilization[1m].mean() > 80"
  severity       = "WARNING"
  destinations   = [var.topic_id]
  body           = "CPU utilization has exceeded 80% for 5 minutes."

  freeform_tags = {
    Environment = "sandbox"
    ManagedBy   = "terraform"
  }
}

variable "compartment_id" {
  description = "Compartment OCID to deploy the example alarm into."
  type        = string
}

variable "topic_id" {
  description = "OCID of the ONS topic notified when the alarm fires."
  type        = string
}

output "alarm_id" {
  value = module.alarm.id
}
