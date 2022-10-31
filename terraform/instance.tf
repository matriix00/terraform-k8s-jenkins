resource "google_compute_instance" "management_vm" {
  name         = "helper-vm"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-b"
  tags = ["helper-tag"]
  project = var.project_id
  boot_disk {
    initialize_params {
        
      image = "debian-cloud/debian-11"
      size = 10
      type = "pd-balanced"

    }
  }
  
# sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin && gcloud container clusters get-credentials cluster-lab --region europe-west1

  metadata_startup_script = "${file("/home/dev97/GraduationProject/terraform/configurations/config.sh")}"
  
  network_interface {
    network = module.network.vpc_id
    subnetwork = module.network.restricted_subnet_id

  }
  service_account {
    email  = google_service_account.service_account.email
    scopes = ["cloud-platform"]
  }

depends_on = [
  google_service_account.service_account,
  google_container_cluster.gke_cluster
]

}
