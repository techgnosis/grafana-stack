resource "grafana_data_source" "Backend" {
  type = "prometheus"
  name = "Backend"
  url  = "https://backend.lab"
}

resource "grafana_data_source" "Frontend" {
  type = "prometheus"
  name = "Frontend"
  url  = "https://frontend.lab"
}