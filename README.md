# terraform-oci-monitoring

Terraform module that manages an [Oracle Cloud Infrastructure](https://www.oracle.com/cloud/)
Monitoring alarm. It evaluates a Monitoring Query Language (MQL) expression over a metric
namespace and notifies one or more destinations (typically Notifications topics) when the
condition holds for the pending duration.

## Usage

```hcl
module "alarm" {
  source = "github.com/cybercapybara/terraform-oci-monitoring"

  compartment_id = var.compartment_id
  display_name   = "prod-high-cpu"
  namespace      = "oci_computeagent"
  query          = "CpuUtilization[1m].mean() > 80"
  severity       = "CRITICAL"
  destinations   = [var.topic_id]

  freeform_tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| oci       | >= 5.0   |

## Inputs

| Name                    | Description                                                        | Type           | Default     | Required |
|-------------------------|--------------------------------------------------------------------|----------------|-------------|:--------:|
| `compartment_id`        | OCID of the compartment in which to create the alarm.              | `string`       | n/a         |   yes    |
| `display_name`          | Human-readable name for the alarm.                                 | `string`       | n/a         |   yes    |
| `metric_compartment_id` | Compartment whose metrics are evaluated. Defaults to compartment.  | `string`       | `null`      |    no    |
| `namespace`             | Metric namespace the alarm queries.                                | `string`       | n/a         |   yes    |
| `query`                 | MQL expression the alarm evaluates.                                | `string`       | n/a         |   yes    |
| `severity`              | Severity (`CRITICAL`, `ERROR`, `WARNING`, `INFO`).                | `string`       | `"WARNING"` |    no    |
| `destinations`          | Destination OCIDs (ONS topics) to notify.                         | `list(string)` | n/a         |   yes    |
| `pending_duration`      | ISO 8601 duration the condition must hold before firing.           | `string`       | `"PT5M"`    |    no    |
| `is_enabled`            | Whether the alarm is enabled.                                      | `bool`         | `true`      |    no    |
| `body`                  | Human-readable message in alarm notifications.                     | `string`       | `null`      |    no    |
| `freeform_tags`         | Free-form tags applied to the alarm.                               | `map(string)`  | `{}`        |    no    |
| `defined_tags`          | Defined tags applied to the alarm, keyed `namespace.key`.          | `map(string)`  | `{}`        |    no    |

## Outputs

| Name           | Description                        |
|----------------|------------------------------------|
| `id`           | OCID of the alarm.                 |
| `display_name` | Display name of the alarm.         |
| `is_enabled`   | Whether the alarm is enabled.      |
| `state`        | Lifecycle state of the alarm.      |

## License

[MIT](LICENSE)
