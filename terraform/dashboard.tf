resource "grafana_dashboard" "PCI" {
  config_json = file("dashboards/pci-dashboard.json")
  folder = grafana_folder.pci.id
}

resource "grafana_dashboard" "HIPAA" {
  config_json = file("dashboards/hipaa-dashboard.json")
  folder = grafana_folder.hipaa.id
}

resource "grafana_dashboard" "HotROD" {
  config_json = file("dashboards/hotrod.json")
}

resource "grafana_dashboard" "RecordedQueries" {
  config_json = file("dashboards/recorded_queries.json")
}