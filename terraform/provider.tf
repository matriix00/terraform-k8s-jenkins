provider "google" {
  project     = "omarmagdy"
  region      = "us-central1"
  credentials = "terraform-service-account.json"
}

resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
}

resource "google_project_service" "container" {
  service = "container.googleapis.com"
}
