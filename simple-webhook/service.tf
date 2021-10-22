resource "kubernetes_service" "simple_webhook" {
  metadata {
    name      = "simple-webhook"
    namespace = "simple-webhook"
  }

  spec {
    port {
      protocol = "TCP"
      port     = 8090
    }

    selector = {
      app = "simple-webhook"
    }
  }
}

