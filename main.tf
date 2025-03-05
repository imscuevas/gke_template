locals {
  workload_identity_string = "${var.project}.svc.id.goog"
}

resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = var.vpc_auto_create_subnetworks
}

resource "google_compute_subnetwork" "cluster_subnet" {
  network       = google_compute_network.vpc.id
  name          = var.cluster_subnet_name
  region        = var.cluster_subnet_region
  ip_cidr_range = var.cluster_subnet_primary_ip_range
  secondary_ip_range {
    range_name    = "for-cluster-pods"
    ip_cidr_range = var.cluster_subnet_secondary_ip_range_for_pods
  }
  secondary_ip_range {
    range_name    = "for-cluster-services"
    ip_cidr_range = var.cluster_subnet_secondary_ip_range_for_services
  }
}

resource "google_compute_subnetwork" "proxy_ilb_subnet" {
  network       = google_compute_network.vpc.id
  name          = var.proxy_ilb_subnet_name
  region        = var.cluster_subnet_region
  ip_cidr_range = var.proxy_ilb_subnet_primary_ip_range
  purpose       = "REGIONAL_MANAGED_PROXY"
  role          = "ACTIVE"
}

resource "google_compute_router" "router" {
  network = google_compute_network.vpc.id
  name    = var.router_name
  region  = var.cluster_subnet_region
}

resource "google_compute_router_nat" "router_nat" {
  router                             = google_compute_router.router.name
  name                               = var.router_nat_name
  region                             = google_compute_router.router.region
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  nat_ip_allocate_option             = "AUTO_ONLY"
}

resource "google_container_cluster" "cluster" {
  name                = var.cluster_name
  location            = var.cluster_location
  network             = google_compute_network.vpc.id
  subnetwork          = google_compute_subnetwork.cluster_subnet.id
  initial_node_count  = var.cluster_initial_node_count
  deletion_protection = var.cluster_deletion_protection

  datapath_provider                        = var.cluster_datapath_provider
  enable_cilium_clusterwide_network_policy = var.cluster_enable_cilium_clusterwide_network_policy
  enable_fqdn_network_policy               = var.cluster_enable_fqdn_network_policy
  enable_intranode_visibility              = var.cluster_enable_intranode_visibility
  enable_l4_ilb_subsetting                 = var.cluster_enable_l4_ilb_subsetting
  enable_multi_networking                  = var.cluster_enable_multi_networking

  addons_config {
    http_load_balancing {
      disabled = var.cluster_http_load_balancing_disabled
    }
    network_policy_config {
      disabled = var.cluster_network_policy_config_disabled
    }
  }

  default_snat_status {
    disabled = var.cluster_default_snat_status_disabled
  }

  gateway_api_config {
    channel = var.cluster_gateway_api_config_channel
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "for-cluster-pods"
    services_secondary_range_name = "for-cluster-services"
  }

  network_policy {
    enabled = var.cluster_network_policy_enabled
    provider = var.cluster_network_policy_provider
  }

  node_config {
    machine_type = var.cluster_default_machine_type
    image_type   = var.cluster_default_image_type
  }

  private_cluster_config {
    enable_private_nodes = true
  }

  release_channel {
    channel = var.cluster_release_channel
  }

  workload_identity_config {
    workload_pool = local.workload_identity_string
  }
}
