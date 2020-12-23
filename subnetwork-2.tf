# AUTHOR - MUHAMMAD IRFAN TAHIR

resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges-2" {
  name          = var.subnet-2
  ip_cidr_range = var.sub-2-cidr-range
  region        = "europe-west2"
  network       = google_compute_network.vpc_network.id

  private_ip_google_access = true
  secondary_ip_range {
    range_name    = var.range-name-2
    ip_cidr_range = var.private-cidr-2-range
  }
}