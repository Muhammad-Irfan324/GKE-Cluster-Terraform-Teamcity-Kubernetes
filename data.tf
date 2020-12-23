# AUTHOR - MUHAMMAD IRFAN TAHIR

data "google_container_engine_versions" "cluster_engine_version" {
  version_prefix = var.cluster_version
  location       = var.location_zone
}

data "google_client_config" "config" {
}
