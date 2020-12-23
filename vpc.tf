# AUTHOR - MUHAMMAD IRFAN TAHIR

resource "google_compute_network" "vpc_network" {
  name                    = var.vpc-name
  description             = "addoptify-vpc-network"
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
  mtu                     = 1500
}

