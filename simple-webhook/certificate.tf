resource "kubernetes_manifest" "certificate" {
  manifest = {
    apiVersion = "cert-manager.io/v1alpha2"
    kind = "Certificate"
    metadata = {
      name = "simple-webhook"
      namespace = "simple-webhook"
    }

    spec = {
        dnsNames = ["prometheus.lab.home", "loki.lab.home"]
        issuerRef = {
            kind = "ClusterIssuer"
            name = "mkcert"
        }
        secretName = "prometheus-tls"
    }
    
  }
}