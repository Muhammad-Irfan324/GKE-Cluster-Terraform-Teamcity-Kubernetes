# AUTHOR - MUHAMMAD IRFAN TAHIR

resource "google_compute_firewall" "default" {
  name    = "addoptify-custom-vpc-firewall-internal-communication"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  source_tags = ["internal-addoptify-vpc-communication"]

  source_ranges = [var.sub-1-cidr-range, var.private-cidr-1-range, var.sub-2-cidr-range, var.private-cidr-2-range, var.sub-3-cidr-range, var.private-cidr-3-range]
}