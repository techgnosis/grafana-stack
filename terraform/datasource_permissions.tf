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

resource "grafana_data_source_permission" "Mimir" {
  depends_on = [grafana_data_source.Mimir]
  datasource_id = grafana_data_source.Mimir.id
  permissions {
    team_id    = grafana_team.HotROD.id
    permission = "Query"
  }
}

resource "grafana_data_source_permission" "Loki" {
  depends_on = [grafana_data_source.Loki]
  datasource_id = grafana_data_source.Loki.id
  permissions {
    team_id    = grafana_team.HotROD.id
    permission = "Query"
  }
}

resource "grafana_data_source_permission" "Tempo" {
  depends_on = [grafana_data_source.Tempo]
  datasource_id = grafana_data_source.Tempo.id
  permissions {
    team_id    = grafana_team.HotROD.id
    permission = "Query"
  }
}

