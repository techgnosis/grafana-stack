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

resource "grafana_data_source" "Prometheus" {
  type = "prometheus"
  name = "Prometheus"
  url = "http://prometheus.prometheus.svc.cluster.local:9090"
}

resource "grafana_data_source" "Loki" {
  type = "loki"
  name = "Loki"
  url = "http://loki.loki.svc.cluster.local:3100"

  json_data {

    derived_field {
      matcher_regex = ".*(?:trace_id\":\\s*\")(.*?)(?:\"|\\s).*"
      name = "trace_id"
      url = "$${__value.raw}"
      datasource_uid = grafana_data_source.Tempo.uid
    }
  }
}

resource "grafana_data_source" "Tempo" {
  type = "tempo"
  name = "Tempo"
  url = "http://tempo.tempo.svc.cluster.local:3100"
}

resource "grafana_data_source" "MySQL" {
  type = "mysql"
  name = "MySQL Grafana DB"
  url = "mysql:3306"
  database_name = "grafana-enterprise"
  username = "grafana-enterprise"

  secure_json_data {
    password = "grafana-enterprise"
  }
}