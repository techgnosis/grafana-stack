resource "grafana_dashboard" "Backend" {
  config_json = file("backend-dashboard.json")
  folder = grafana_folder.Backend.id
}

resource "grafana_dashboard" "Frontend" {
  config_json = file("frontend-dashboard.json")
  folder = grafana_folder.Frontend.id
}