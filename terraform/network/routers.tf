resource "google_compute_router" "nat_router" {
  name    = "nat-router"
  network = google_compute_network.vpc_network.name
  project = var.project_id
  region = var.region_name
}