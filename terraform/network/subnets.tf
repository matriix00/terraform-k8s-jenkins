
resource "google_compute_subnetwork" "restricted_subnet" {
  name          = "restricted-subnet"
  project = var.project_id
  ip_cidr_range = var.subnet_cidrs[1]
  region        = var.region_name 
  network       = google_compute_network.vpc_network.id
  private_ip_google_access = true
  secondary_ip_range {
    range_name = "k8s-pod-ip"
    ip_cidr_range = "10.3.0.0/16"
  }
    secondary_ip_range {
    range_name    = "k8s-service-ip"
    ip_cidr_range = "10.2.0.0/16"
  }
}