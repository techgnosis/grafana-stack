terraform {
  required_providers {
    grafana = {
      source = "grafana/grafana"
      version = "1.20.0"
    }
  }
}

provider "grafana" {
  url = "https://grafana.lab.home"
  auth = "admin:admin"
}