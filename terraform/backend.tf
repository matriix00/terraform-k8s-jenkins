# Terraform has a backend called gcs that includes locking
# gcs stores the state as an object in a configurable prefix and bucket on Google Cloud Storage (GCS).
terraform {
  backend "gcs" {
    bucket = "iti-bucket1-gcp"
    prefix = "terraform/state"
  }

}
