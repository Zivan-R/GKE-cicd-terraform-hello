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
    location = var.zone
    initial_node_count = 1

    node_config { 
        machine_type = "e2-small"
    }

    logging_service = "logging.googleapis.com/kubernetes"
    monitoring_service = "monitoring.googleapis.com/kubernetes"

    deletion_protection = false
}