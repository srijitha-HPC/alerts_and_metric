variable "project" {
  type        = string
  description = "The display name"
  default = "hpc-lab-316407"
}

variable "display_name" {
  type        = string
  description = "The display name"
  default = "CPU utilization and filestore1010101"
}

variable "alert_combiner" {
  type        = string
  description = "Combiner of alert"
  default = "OR"
}

variable "duration" {
  type        = string
  description = "Duration of the condition"
  default = "60s"
}

variable "condition_comparison" {
  type        = string
  description = "Comparison such as greater than or lower than of the given condition"
  default     =  "COMPARISON_GT"
}

variable "aggregations_aligner" {
  type        = string
  description = "Aggregation aligner to be displayed"
  default  = "ALIGN_NONE"
}

variable "trigger_count" {
  type        = number
  description = "trigger count"
  default  = 1
}




variable "notification_email_addresses" {
  description = "The email for notifications"
  type   = list(string)
  default = ["srijitha999@gmail.com",
            "srijitha.s@hcl.com"]
}