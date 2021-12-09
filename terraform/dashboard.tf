resource "grafana_dashboard" "Backend" {
  config_json = file("dashboards/backend-dashboard.json")
  folder = grafana_folder.Backend.id
}

resource "grafana_dashboard" "Frontend" {
  config_json = file("dashboards/frontend-dashboard.json")
  folder = grafana_folder.Frontend.id
}

resource "grafana_dashboard" "GrafanaHealth" {
  config_json = file("dashboards/grafana-health-dashboard.json")
  folder = grafana_folder.GrafanaHealth.id
}