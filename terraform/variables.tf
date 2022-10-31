variable "subnet_cidrs" {
  type = list(string)
}

variable "project_id" {
  type = string
}

variable "region_name" {
  type = string
}

variable "nat_router" {
  type = string
}

variable "service_account_role" {
  type = list(string)
}