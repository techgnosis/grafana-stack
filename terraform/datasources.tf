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

resource "grafana_data_source" "RecordedQueries" {
  type = "prometheus"
  name = "Recorded Queries"
  url  = "http://prometheus:9090"
}