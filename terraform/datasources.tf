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
}

resource "grafana_data_source" "Tempo" {
  type = "tempo"
  name = "Tempo"
  url = "http://tempo.tempo.svc.cluster.local:3100"
}