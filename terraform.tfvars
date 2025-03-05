// Project-wide variables
project = "<project_id>"
region  = "us-central1"
zone    = "us-central1-a"

// VPC variables
vpc_name                    = "for-test-cluster"
vpc_auto_create_subnetworks = false

// Cluster subnet variables
cluster_subnet_name                            = "for-test-cluster"
cluster_subnet_region                          = "us-central1"
cluster_subnet_primary_ip_range                = "192.168.0.0/24"
cluster_subnet_secondary_ip_range_for_pods     = "172.31.0.0/17"
cluster_subnet_secondary_ip_range_for_services = "172.31.128.0/17"

// Proxy ILB subnet variables
proxy_ilb_subnet_name             = "for-proxy-ilbs"
proxy_ilb_subnet_primary_ip_range = "192.168.1.0/24"

// Router variables
router_name = "for-test-cluster"

// Cloud NAT variables
router_nat_name = "for-test-cluster-nat"

// Cluster variables
cluster_name                 = "test-cluster"
cluster_location             = "us-central1"
cluster_initial_node_count   = 1
cluster_deletion_protection  = false
cluster_release_channel      = "REGULAR"
cluster_default_machine_type = "n2-standard-4"
cluster_default_image_type   = "COS_CONTAINERD"

// Cluster networking variables
cluster_datapath_provider                        = "ADVANCED_DATAPATH"
cluster_enable_cilium_clusterwide_network_policy = false
cluster_enable_fqdn_network_policy               = false
cluster_enable_intranode_visibility              = false
cluster_enable_l4_ilb_subsetting                 = true
cluster_enable_multi_networking                  = false
cluster_default_snat_status_disabled             = false
cluster_http_load_balancing_disabled             = false
cluster_network_policy_config_disabled           = true
cluster_network_policy_enabled                   = false
cluster_gateway_api_config_channel               = "CHANNEL_STANDARD"
