
resource "kubernetes_service" "single_pod_service" {
    depends_on = [ kubernetes_pod.single_pod ]
  metadata {
    name      = "rashid-ssh-service"
    namespace = "rashid"
    labels    = var.pod_label
  }
  spec {
    type     = "NodePort"
    selector = var.pod_label
    port {
      name        = "ssh"
      target_port = 22
      port        = 22
      node_port   = 30810
    }
  }
}
