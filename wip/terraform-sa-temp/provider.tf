terraform {
  required_providers {
    grafana = {
      source = "grafana/grafana"
      version = "1.23.0"
    }
  }
}

provider "grafana" {
  url = "https://grafana.lab.home"
  auth = "eyJrIjoiNWt0RU56V1RGNXVlSjNYcXVHNkFtcjh4TnJDV0RaSVYiLCJuIjoiU0F0b2tlbiIsImlkIjoxfQ=="
}