variable "project_id" {
    default = "eng-interface-167123"
}

variable "region" {
    default = "europe-west1"
}

variable "zone" {
    default = "${var.region}-a" 
}

variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}

variable "default_service_account" {
    default = "your_service_accoount@developer.gserviceaccount.com"
}