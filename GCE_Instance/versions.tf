terraform {
  required_version = ">=1.1.9"
  required_providers {
    google = {
      version = ">=4.20.0"
      source  = "hashicorp/google"
    }
    google-beta = {
      version = ">=4.20.0"
      source  = "hashicorp/google-beta"
    }
  }
}