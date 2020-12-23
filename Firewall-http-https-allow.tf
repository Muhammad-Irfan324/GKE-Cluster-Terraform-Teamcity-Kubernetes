# AUTHOR - MUHAMMAD IRFAN TAHIR

resource "google_compute_firewall" "default-2" {
  name    = "addoptify-custom-vpc-firewall-allow-http-https"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_tags = ["addoptify-vpc-http-https"]

  source_ranges = ["0.0.0.0/0"]
}