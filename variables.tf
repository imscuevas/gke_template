// Project-wide variables
variable "project" {
  type        = string
  description = "Project ID"
}
variable "region" {
  type        = string
  description = "Project default region"
}
variable "zone" {
  type        = string
  description = "Project default zone"
}

// VPC variables
variable "vpc_name" {
  type        = string
  description = "VPC name"
}
variable "vpc_auto_create_subnetworks" {
  type        = bool
  description = "Auto create subnetworks?"
}

// Cluster subnet variables
variable "cluster_subnet_name" {
  type        = string
  description = "Cluster subnet name"
}
variable "cluster_subnet_region" {
  type        = string
  description = "Cluster subnet region"
}
variable "cluster_subnet_primary_ip_range" {
  type        = string
  description = "Cluster subnet primary IP range"
}
variable "cluster_subnet_secondary_ip_range_for_pods" {
  type        = string
  description = "Cluster subnet secondary IP range for pods"
}
variable "cluster_subnet_secondary_ip_range_for_services" {
  type        = string
  description = "Cluster subnet secondary IP range for services"
}

// Proxy ILB subnet variables
variable "proxy_ilb_subnet_name" {
  type        = string
  description = "Proxy ILB subnet name"
}
variable "proxy_ilb_subnet_primary_ip_range" {
  type        = string
  description = "Proxy ILB subnet name"
}

// Router variables
variable "router_name" {
  type        = string
  description = "Router name"
}

// Cloud NAT variables
variable "router_nat_name" {
  type        = string
  description = "NAT name"
}

// Cluster variables
variable "cluster_name" {
  type        = string
  description = "Cluster name"
}
variable "cluster_location" {
  type        = string
  description = "Cluster location"
}
variable "cluster_initial_node_count" {
  type        = number
  description = "Cluster initial node count"
}
variable "cluster_release_channel" {
  type        = string
  description = "Cluster release channel"
}
variable "cluster_deletion_protection" {
  type        = bool
  description = "Deletion protection enabled?"
}
variable "cluster_default_machine_type" {
  type        = string
  description = "Cluster default machine type"
}
variable "cluster_default_image_type" {
  type        = string
  description = "Cluster default image type"
}

// Cluster networking variables
variable "cluster_datapath_provider" {
  type        = string
  description = "Cluster datapath provider"
}
variable "cluster_enable_cilium_clusterwide_network_policy" {
  type        = bool
  description = "Enable CiliumClusterwideNetworkPolicy?"
}
variable "cluster_enable_fqdn_network_policy" {
  type        = bool
  description = "Enable FQDNNetworkPolicy?"
}
variable "cluster_enable_intranode_visibility" {
  type        = bool
  description = "Enable Intranode Visibility?"
}
variable "cluster_enable_l4_ilb_subsetting" {
  type        = bool
  description = "Enable L4 ILB subsetting?"
}
variable "cluster_enable_multi_networking" {
  type        = bool
  description = "Enable Multi Networking?"
}
variable "cluster_default_snat_status_disabled" {
  type        = bool
  description = "Cluster default snat disabled?"
}
variable "cluster_network_policy_config_disabled" {
  type        = bool
  description = "Cluster Network policy config disabled?"
}
variable "cluster_network_policy_enabled" {
  type        = bool
  description = "Enable Network policy (Calico)?"
}
variable "cluster_network_policy_provider" {
  type = string
  description = "Network policy provider"
}
variable "cluster_http_load_balancing_disabled" {
  type        = bool
  description = "Cluster HTTP Load Balancing disabled?"
}
variable "cluster_gateway_api_config_channel" {
  type        = string
  description = "Cluster Gateway API config channel"
}