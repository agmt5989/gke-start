output "kubernetes_cluster_name" {
  value = google_container_cluster.primary.name
}

output "kubernetes_cluster_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "kubernetes_cluster_ca_certificate" {
  value = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
}

output "kubernetes_cluster_client_certificate" {
  value = base64decode(google_container_cluster.primary.master_auth[0].client_certificate)
}

output "kubernetes_cluster_client_key" {
  value = base64decode(google_container_cluster.primary.master_auth[0].client_key)
}