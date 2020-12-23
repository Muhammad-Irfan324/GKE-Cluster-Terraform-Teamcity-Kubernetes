# AUTHOR - MUHAMMAD IRFAN TAHIR

resource "google_container_cluster" "google_container_cluster" {
  project                  = var.project_name
  name                     = format("%s-cluster", var.cluster_name)
  initial_node_count       = var.initial_node_count
  min_master_version       = data.google_container_engine_versions.cluster_engine_version.latest_master_version
  network                  = google_compute_network.vpc_network.name
  subnetwork               = google_compute_subnetwork.network-with-private-secondary-ip-ranges.name
  remove_default_node_pool = true
  logging_service          = var.logging_service
  monitoring_service       = var.monitoring_service
  location                 = var.location_zone


  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "/16"
    services_ipv4_cidr_block = "/22"
  }


  enable_legacy_abac = true

  master_authorized_networks_config {
    dynamic "cidr_blocks" {
      for_each = var.master_authorized_networks_config
      content {
        cidr_block   = cidr_blocks.value.cidr_block
        display_name = lookup(cidr_blocks.value, "display_name", null)
      }
    }
  }

  master_auth {
    username = var.cluster_master_username
    password = var.cluster_master_password

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  addons_config {
    http_load_balancing {
      disabled = var.http_load_balancing
    }
  }

  depends_on = [data.google_container_engine_versions.cluster_engine_version]
}


resource "google_container_node_pool" "primary_preemptible_nodes" {
  name     = var.node_pool_name
  location = var.location_zone
  cluster  = google_container_cluster.google_container_cluster.name


  node_config {
    preemptible     = var.preemptible
    machine_type    = var.node_machine_type
    disk_size_gb    = var.node_disk_size_gb
    disk_type       = var.node_disk_type
    tags            = var.node_tags
    oauth_scopes    = var.oauth_scopes
    image_type      = var.os_image_type
    service_account = google_service_account.trusted_zone_cluster_sa.email


    metadata = {
      disable-legacy-endpoints = "true"
    }
  }

  initial_node_count = var.initial_node_count
  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  management {
    auto_repair  = "true"
    auto_upgrade = "true"
  }

  depends_on = [google_container_cluster.google_container_cluster]


  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials ${google_container_cluster.google_container_cluster.name} --zone  ${google_container_cluster.google_container_cluster.location} --project ${google_container_cluster.google_container_cluster.project}"
  }
}
