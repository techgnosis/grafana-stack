resource "grafana_folder_permission" "pci" {
  folder_uid = grafana_folder.pci.uid
  permissions {
    team_id    = grafana_team.pci.id
    permission = "Admin"
  }
}

resource "grafana_folder_permission" "hipaa" {
  folder_uid = grafana_folder.hipaa.uid
  permissions {
    team_id    = grafana_team.hipaa.id
    permission = "Admin"
  }
}
