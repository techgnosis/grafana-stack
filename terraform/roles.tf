resource "grafana_role" "satest" {
  name        = "SATest"
  description = "Role to allow a service account to own a folder"
  uid         = "satestuid"
  version = "1"
  global      = true


  permissions {
    action = "folders:read"
    scope  = "folders:uid:UD8nUqunz"
  }

  permissions {
    action = "folders:write"
    scope  = "folders:uid:UD8nUqunz"
  }

  permissions {
    action = "dashboards:create"
    scope = "folders:uid:UD8nUqunz"
  }

  permissions {
    action = "dashboards:write"
    scope  = "folders:uid:UD8nUqunz"
  }
  
  permissions {
    action = "dashboards:read"
    scope  = "folders:uid:UD8nUqunz"
  }

  permissions {
    action = "dashboards:delete"
    scope  = "folders:uid:UD8nUqunz"
  }
}