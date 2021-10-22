resource "kubernetes_namespace" "simple_webhook" {
  metadata {
    name = "simple-webhook"
  }
}

