

output "restricted_subnet_id" {
  value = google_compute_subnetwork.restricted_subnet.id
}



output "vpc_id" {
  value = google_compute_network.vpc_network.id
}