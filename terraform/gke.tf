resource "google_container_cluster" "gke_cluster" {
  
name = "cluster-jenkins"
location = var.region_name
initial_node_count = 1
network = module.network.vpc_id
subnetwork = module.network.restricted_subnet_id
remove_default_node_pool = true

  ip_allocation_policy {
    cluster_secondary_range_name  = "k8s-pod-ip"
    services_secondary_range_name = "k8s-service-ip"
  }

private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }
  
   master_authorized_networks_config {
    cidr_blocks {
      cidr_block = var.subnet_cidrs[1]
      display_name="restricted-subnet"
    }

}

depends_on = [
  google_project_service.container,
  google_project_service.compute
]

}


resource "google_container_node_pool" "node_pool" {
  
  name       = "my-node-pool"
  cluster    = google_container_cluster.gke_cluster.id
  node_count = 1

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = false
    machine_type = "e2-medium"

    service_account = google_service_account.service_account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }


}
