resource "grafana_team" "Frontend" {
  name  = "Frontend"
}

resource "grafana_team" "Backend" {
  name  = "Backend"
}

resource "grafana_team" "Managers" {
  name  = "Managers"
}

resource "grafana_team" "HotROD" {
  name = "HotROD"
}