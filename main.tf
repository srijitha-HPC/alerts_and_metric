resource "google_monitoring_notification_channel" "notification_channel" {
  count        = "${length(var.notification_email_addresses)}"
  project      = "${var.project}"
  enabled      = true
  display_name = "Send email to ${element(var.notification_email_addresses, count.index)}"
  type         = "email"

  labels = {
    email_address = "${element(var.notification_email_addresses, count.index)}"
  }
}


resource "google_monitoring_alert_policy" "alert_policy" {
  display_name = var.display_name
  combiner     = var.alert_combiner
  notification_channels = "${google_monitoring_notification_channel.notification_channel.*.name}"
  
  
  conditions   {
    display_name = "Alert on cpu utilization"
    
    condition_threshold  {
      filter          = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" AND resource.type=\"gce_instance\""
      
      duration        = var.duration
      comparison      = var.condition_comparison
      threshold_value = 0.5
      trigger {
        count = var.trigger_count
      }
      aggregations {
        alignment_period   = var.duration
        per_series_aligner = var.aggregations_aligner
      }
    }
  
  }

  conditions   {
    display_name = "Alert for used disk space for filestore"
        
    condition_threshold  {
      filter          = "metric.type=\"file.googleapis.com/nfs/server/used_bytes_percent\" AND resource.type=\"filestore_instance\""
      
      duration        = var.duration
      comparison      = var.condition_comparison
      threshold_value = 0.8
      trigger {
        count = var.trigger_count
      }
      aggregations {
        alignment_period   = var.duration
        per_series_aligner = var.aggregations_aligner
      }
    }
  }
}