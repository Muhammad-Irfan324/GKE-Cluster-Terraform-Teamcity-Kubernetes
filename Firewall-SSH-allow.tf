# AUTHOR - MUHAMMAD IRFAN TAHIR

resource "google_compute_firewall" "default-3" {
  name    = "addoptify-custom-vpc-firewall-allow-ssh-rdp"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_tags = ["addoptify-vpc-ssh-rdp"]

  source_ranges = ["0.0.0.0/0"]
}