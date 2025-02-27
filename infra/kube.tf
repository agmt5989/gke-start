# GKE cluster
resource "google_container_cluster" "primary" {  
   name     = "${var.project_id}-gke"  
   location = var.region    
   min_master_version = "1.14.10-gke.27"     
   remove_default_node_pool = true  
   initial_node_count       = 1   

   node_config {
    machine_type = "e2-medium"
  }
   
   network    = google_compute_network.vpc.name  
   subnetwork = google_compute_subnetwork.subnet.name
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "${google_container_cluster.primary.name}-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  
  autoscaling {
    min_node_count = 1
    max_node_count = 5
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only"
    ]

    labels = {
      env = var.project_id
    }

    preemptible  = true
    machine_type = "n1-standard-1"
    tags         = ["gke-node", "${var.project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
