resource "grafana_data_source_permission" "Backend" {
  depends_on = [grafana_data_source.Backend]
  datasource_id = grafana_data_source.Backend.id
  permissions {
    team_id    = grafana_team.Backend.id
    permission = "Query"
  }
}

resource "grafana_data_source_permission" "Frontend" {
  depends_on = [grafana_data_source.Frontend]
  datasource_id = grafana_data_source.Frontend.id
  permissions {
    team_id    = grafana_team.Frontend.id
    permission = "Query"
  }
}