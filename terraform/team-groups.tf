resource "grafana_team_external_group" "Frontend" {
  team_id  = grafana_team.Frontend.id
  groups = ["cn=Frontend,ou=Groups,dc=example,dc=org"]
}

resource "grafana_team_external_group" "Backend" {
  team_id  = grafana_team.Backend.id
  groups = ["cn=Backend,ou=Groups,dc=example,dc=org"]
}

resource "grafana_team_external_group" "Managers" {
  team_id  = grafana_team.Managers.id
  groups = ["cn=Managers,ou=Groups,dc=example,dc=org"]
}