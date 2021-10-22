resource "kubernetes_deployment" "simple_webhook" {
  metadata {
    name      = "simple-webhook"
    namespace = "simple-webhook"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "simple-webhook"
      }
    }

    template {
      metadata {
        labels = {
          app = "simple-webhook"
        }
      }

      spec {
        container {
          name  = "simple-webhook"
          image = "techgnosis/simple-webhook:1"

          port {
            container_port = 8090
          }

          image_pull_policy = "Always"
        }
      }
    }
  }
}

