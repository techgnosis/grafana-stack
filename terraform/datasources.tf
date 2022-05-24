resource "grafana_data_source" "pci" {
  type = "loki"
  name = "PCI"
  url  = "https://backend.lab"
}

resource "grafana_data_source" "hipaa" {
  type = "loki"
  name = "HIPAA"
  url  = "https://frontend.lab"
}

resource "grafana_data_source" "mimir" {
  type = "prometheus"
  name = "Mimir"
  url = "https://mimir.lab.home/prometheus"
  uid = "zgBXVaa7k"

  json_data {
    tls_skip_verify = true
  }
}

resource "grafana_data_source" "loki" {
  type = "loki"
  name = "Loki"
  url = "https://loki.lab.home"
  uid = "zl2ZeQB7z"

  json_data {

    tls_skip_verify = true

    derived_field {
      matcher_regex = ".*(?:trace_id\":\\s*\")(.*?)(?:\"|\\s).*"
      name = "trace_id"
      url = "$${__value.raw}"
      datasource_uid = grafana_data_source.tempo.uid
    }
  }
}

resource "grafana_data_source" "tempo" {
  type = "tempo"
  name = "Tempo"
  url = "https://tempo.lab.home"
  uid = "_JhW6wfnz"

  json_data {
    tls_skip_verify = true
  }
}

resource "grafana_data_source" "mysql" {
  type = "mysql"
  name = "MySQL Grafana DB"
  url = "mysql:3306"
  database_name = "grafana-enterprise"
  username = "grafana-enterprise"
  uid = "_q642H87k"

  secure_json_data {
    password = "grafana-enterprise"
  }
}