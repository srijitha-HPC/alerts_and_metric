variable "display_name" {
  type        = string
  description = "The display name"
  default = "CPU utilization and filestore999675"
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




variable "notification_channels" {
  type = list
  description = "List of email ids"
  default =["projects/hpc-lab-316407/notificationChannels/9612192781086906899",
            "projects/hpc-lab-316407/notificationChannels/617403293521240308",
            "projects/hpc-lab-316407/notificationChannels/1664761978761983337"]
}
