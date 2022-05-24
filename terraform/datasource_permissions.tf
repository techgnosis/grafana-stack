resource "grafana_data_source_permission" "pci" {
  depends_on = [grafana_data_source.pci]
  datasource_id = grafana_data_source.pci.id
  permissions {
    team_id    = grafana_team.pci.id
    permission = "Query"
  }
}

resource "grafana_data_source_permission" "hipaa" {
  depends_on = [grafana_data_source.hipaa]
  datasource_id = grafana_data_source.hipaa.id
  permissions {
    team_id    = grafana_team.hipaa.id
    permission = "Query"
  }
}
