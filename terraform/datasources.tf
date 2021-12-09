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

resource "grafana_data_source" "InterlakeMetrics" {
  type = "prometheus"
  name = "Interlake Metrics"
  url  = "http://gem-enterprise-metrics-gateway.gem.svc.cluster.local:8080/prometheus"
  basic_auth_enabled = true
  basic_auth_username = "interlake"
  basic_auth_password = "aW50ZXJsYWtlLWFsbC1hbGw6ezFgJjo1PSs1dTc3RnQ+KDkyODc5Iy5V"
}

resource "grafana_data_source" "InterlakeLogs" {
  type = "loki"
  name = "Interlake Logs"
  url = "http://gateway.gel.svc.cluster.local:3100"
  basic_auth_enabled = true
  basic_auth_username = "interlake"
  basic_auth_password = "aW50ZXJsYWtlLWFsbC1hbGw6JXsxWzJkfjhjMSU3WWZ7fTE0XTEyJSU3"
}

resource "grafana_data_source" "InterlakeTraces" {
  type = "tempo"
  name = "Interlake Traces"
  url = "http://tempo.tempo.svc.cluster.local:3100"
}

resource "grafana_data_source" "RecordedQueries" {
  type = "prometheus"
  name = "Recorded Queries"
  url  = "http://prometheus:9090"
}