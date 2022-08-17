resource "grafana_dashboard" "derpdash" {
  config_json = file("dashboards/derpdash.json")
  folder = "29"
}