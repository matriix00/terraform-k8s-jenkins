project_id   = "omarmagdy"
subnet_cidrs = ["10.0.0.0/24","10.0.1.0/24"]
region_name  = "europe-west1"
nat_router = "nat_router"

service_account_role = [ 
    "roles/container.admin",
    "roles/container.clusterAdmin",
    "roles/container.clusterViewer",
    "roles/container.developer",
    "roles/container.hostServiceAgentUser",
    "roles/container.viewer",
    "roles/storage.admin",
    "roles/admin",
     ]