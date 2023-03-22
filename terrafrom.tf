# GCP load balancer with backend service
terraform {
    required_version = ">= 0.12.0"
    required_providers {
        google = {
        source  = "hashicorp/google"
        version = "4.58.0"
        }
    }
}

