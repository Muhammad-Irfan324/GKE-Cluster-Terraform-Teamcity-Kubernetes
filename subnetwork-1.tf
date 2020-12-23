# AUTHOR - MUHAMMAD IRFAN TAHIR

resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  name          = var.subnet-1
  ip_cidr_range = var.sub-1-cidr-range
  region        = "europe-west2"
  network       = google_compute_network.vpc_network.id

  private_ip_google_access = true
  secondary_ip_range {
    range_name    = var.range-name-1
    ip_cidr_range = var.private-cidr-1-range
  }
}
