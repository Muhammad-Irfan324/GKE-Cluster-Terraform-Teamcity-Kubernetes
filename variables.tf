# AUTHOR - MUHAMMAD IRFAN TAHIR

variable "project_name" {
  default = "addoptify-teamcity"
}

variable "vpc-name" {
  default = "addoptify-vpc-network"
}

variable "subnet-1" {
  default = "addoptify-subnetwork-1"
}

variable "sub-1-cidr-range" {
  default = "172.16.0.0/16"
}
variable "subnet-2" {
  default = "addoptify-subnetwork-2"
}

variable "sub-2-cidr-range" {
  default = "172.18.0.0/16"
}

variable "subnet-3" {
  default = "addoptify-subnetwork-3"
}

variable "sub-3-cidr-range" {
  default = "172.20.0.0/16"
}

variable "range-name-1" {
  default = "addoptify-secondary-range-update1"
}

variable "private-cidr-1-range" {
  default = "192.168.10.0/24"
}

variable "range-name-2" {
  default = "addoptify-secondary-range-update2"
}

variable "private-cidr-2-range" {
  default = "192.168.11.0/24"
}

variable "range-name-3" {
  default = "addoptify-secondary-range-update3"
}

variable "private-cidr-3-range" {
  default = "192.168.12.0/24"
}

#################################################################


variable "location_zone" {
  type        = string
  default     = "europe-west2-a"
  description = "defining zone"
}

variable "network" {
  type    = string
  default = "default"
}
variable "subnetwork" {
  type    = string
  default = "default"
}

variable "cluster_version" {
  type    = string
  default = "1.17.13-gke.2001"
}
variable "cluster_name" {
  type    = string
  default = "addoptify-teamcity-cluster"
}
variable "initial_node_count" {
  type    = number
  default = 3
}
variable "max_node_count" {
  type        = number
  default     = 5
  description = "Maximum number of nodes in the NodePool. Must be >= min_node_count."
}
variable "min_node_count" {
  type        = number
  default     = 3
  description = "Minimum number of nodes in the NodePool. Must be >=0 and <= max_node_count."
}
variable "node_machine_type" {
  type        = string
  default     = "e2-medium"
  description = "The name of a Google Compute Engine machine type. Defaults to n1-standard-4. To create a custom machine type, value should be set as specified here."
}

variable "os_image_type" {
  type        = string
  default     = "Ubuntu"
  description = "Image Type Of Os Setting to Ubuntu by default"
}
variable "node_disk_size_gb" {
  type        = number
  default     = 50
  description = "Size of disk on worker nodes."
}

variable "node_disk_type" {
  type        = string
  default     = "pd-standard"
  description = "Type of disk o worker nodes."
}
variable "cluster_master_username" {
  type    = string
  default = ""
}
variable "cluster_master_password" {
  type    = string
  default = ""
}
variable "logging_service" {
  type    = string
  default = "logging.googleapis.com/kubernetes"
}
variable "monitoring_service" {
  type    = string
  default = "monitoring.googleapis.com/kubernetes"
}
variable "oauth_scopes" {
  type = list(string)
  default = [
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/sqlservice.admin",
  ]
  description = "The set of Google API scopes to be made available on all of the node VMs under the 'default' service account. These can be either FQDNs, or scope aliases. The following scopes are necessary to ensure the correct functioning of the cluster:"
}

variable "master_authorized_networks_config" {
  type        = list(object({ cidr_block = string, display_name = string }))
  description = "List of master authorized networks. If none are provided, disallow external access (except the cluster node IPs, which GKE automatically whitelists)."
  default = [
    {
      cidr_block   = "0.0.0.0/0"
      display_name = "all-for-dev"
    }
  ]
}
variable "node_tags" {
  description = "(Optional) Tags for nodes"
  type        = list(string)
  default     = []
}
variable "http_load_balancing" {
  description = "(Optional) The status of the HTTP (L7) load balancing controller addon, which makes it easy to set up HTTP load balancers for services in a cluster. set true to disable."
  type        = bool
  default     = false
}
variable "preemptible" {
  description = "Enable or Disable node pool preemptible instances"
  type        = bool
  default     = true
}
variable "node_pool_name" {
  default = "addoptify-pool-node"
}


