
resource "google_compute_router_nat" "nat" {
  name = "private-nat"
  router = google_compute_router.nat_router.name
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  region = var.region_name
  nat_ip_allocate_option = "AUTO_ONLY"
  subnetwork {
    name                    = google_compute_subnetwork.restricted_subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

}
  



