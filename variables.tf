variable "compartment_id" {
  description = "OCID of the compartment in which to create the alarm."
  type        = string
}

variable "display_name" {
  description = "Human-readable name for the alarm."
  type        = string
}

variable "metric_compartment_id" {
  description = "OCID of the compartment whose metrics the alarm evaluates. Defaults to compartment_id."
  type        = string
  default     = null
}

variable "namespace" {
  description = "Metric namespace the alarm queries (e.g. oci_computeagent)."
  type        = string
}

variable "query" {
  description = "Monitoring Query Language (MQL) expression the alarm evaluates."
  type        = string
}

variable "severity" {
  description = "Severity of the alarm."
  type        = string
  default     = "WARNING"

  validation {
    condition     = contains(["CRITICAL", "ERROR", "WARNING", "INFO"], var.severity)
    error_message = "severity must be CRITICAL, ERROR, WARNING, or INFO."
  }
}

variable "destinations" {
  description = "List of destination OCIDs (typically ONS topics) to notify when the alarm fires."
  type        = list(string)

  validation {
    condition     = length(var.destinations) > 0
    error_message = "At least one destination OCID must be provided."
  }
}

variable "pending_duration" {
  description = "How long the condition must hold before firing, as an ISO 8601 duration (e.g. PT5M)."
  type        = string
  default     = "PT5M"
}

variable "is_enabled" {
  description = "Whether the alarm is enabled."
  type        = bool
  default     = true
}

variable "body" {
  description = "Human-readable message included in alarm notifications."
  type        = string
  default     = null
}

variable "freeform_tags" {
  description = "Free-form tags applied to the alarm."
  type        = map(string)
  default     = {}
}

variable "defined_tags" {
  description = "Defined tags applied to the alarm, keyed as \"namespace.key\"."
  type        = map(string)
  default     = {}
}
