terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.1.0"
    }
  }
}

provider "google" {
  credentials = "solutions-engineering-248511-fc41fd026efe.json"
}