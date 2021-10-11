provider "google" {
    project     = "pragmatic-will-324605"
}

resource "google_service_account" "default1" {
  account_id   = "pragmatic-will-324605"
  display_name = "test-terraform2"
}

resource "google_container_cluster" "primary1" {
  name     = "my-gke-cluster2"
  location = "us-central1"

  
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.primary1.name
  node_count = 1

  
}


