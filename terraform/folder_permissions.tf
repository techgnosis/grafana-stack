resource "grafana_folder_permission" "Frontend" {
  folder_uid = grafana_folder.Frontend.uid
  permissions {
    team_id    = grafana_team.Frontend.id
    permission = "Admin"
  }
}

resource "grafana_folder_permission" "Backend" {
  folder_uid = grafana_folder.Backend.uid
  permissions {
    team_id    = grafana_team.Backend.id
    permission = "Admin"
  }
}