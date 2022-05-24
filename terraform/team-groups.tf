resource "grafana_team_external_group" "PCI" {
  team_id  = grafana_team.pci.id
  groups = ["cn=Frontend,ou=Groups,dc=example,dc=org"]
}

resource "grafana_team_external_group" "HIPAA" {
  team_id  = grafana_team.hipaa.id
  groups = ["cn=Backend,ou=Groups,dc=example,dc=org"]
}
