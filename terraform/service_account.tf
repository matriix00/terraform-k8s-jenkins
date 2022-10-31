resource "google_service_account" "service_account" {
  account_id   = "terraform-gcp-account"
  display_name = "terraform-gcp-account"
}



resource "google_project_iam_binding" "cluster" {
  count = length(var.service_account_role)
  project = var.project_id
  role   =var.service_account_role[count.index] 
  
  members = [
    "serviceAccount:${google_service_account.service_account.email}",
  ]
}


resource "google_service_account_key" "mykey" {
  service_account_id = google_service_account.service_account.name
  public_key_type    = "TYPE_X509_PEM_FILE"
  private_key_type = "TYPE_GOOGLE_CREDENTIALS_FILE"
}

