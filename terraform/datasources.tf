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

resource "grafana_data_source_permission" "Backend" {
  datasource_id = grafana_data_source.Backend.id
  permissions {
    team_id    = grafana_team.Backend.id
    permission = "Query"
  }
}

resource "grafana_data_source_permission" "Frontend" {
  datasource_id = grafana_data_source.Frontend.id
  permissions {
    team_id    = grafana_team.Frontend.id
    permission = "Query"
  }
}