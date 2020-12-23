# AUTHOR - MUHAMMAD IRFAN TAHIR

resource "google_service_account" "trusted_zone_cluster_sa" {
  account_id = "trusted-zone-cluster-sa"
}

resource "google_project_iam_member" "trusted_zone_cluster_sa_log_writer" {
  role   = "roles/logging.logWriter"
  member = "serviceAccount:${google_service_account.trusted_zone_cluster_sa.email}"
}

resource "google_project_iam_member" "trusted_zone_cluster_sa_metric_writer" {
  role   = "roles/monitoring.metricWriter"
  member = "serviceAccount:${google_service_account.trusted_zone_cluster_sa.email}"
}

resource "google_project_iam_member" "trusted_zone_cluster_sa_object_viewer" {
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.trusted_zone_cluster_sa.email}"
}
