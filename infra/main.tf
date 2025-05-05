terraform {
    backend "gcs" { 
        bucket = "hello-terraform-zbucket"
        prefix = "hello-z" 
    }
}

provider "google" {
    project = var.project_id
    region = var.region
}

resource "google_container_cluster" "primary" {
    name = var.cluster
    location = var.region
    initial_node_count = 1
    node_config { 
        machine_type = "e2-medium" 
    }
}