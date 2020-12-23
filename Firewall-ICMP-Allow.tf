# AUTHOR - MUHAMMAD IRFAN TAHIR

resource "google_compute_firewall" "default-1" {
  name    = "addoptify-custom-vpc-firewall-allow-ping"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  source_tags = ["addoptify-vpc-allow-ping"]

  source_ranges = ["0.0.0.0/0"]
}