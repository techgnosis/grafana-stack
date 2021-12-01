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

resource "grafana_data_source" "GrafanaPostgres" {
  type = "postgres"
  name = "Grafana Database"
  database_name = "grafana-enterprise"
  url  = "postgres:5432"
  username = "grafana-enterprise"
  secure_json_data {
    password = "grafana-enterprise"
  }
  json_data {
    ssl_mode = "disable"
    postgres_version = "1200"
  }
  
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