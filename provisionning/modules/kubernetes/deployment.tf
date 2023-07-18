resource "kubernetes_deployment" "rashid-ssh-deployment" {
  metadata {
    name      = "rashid-deployment-ssh"
    labels    = var.deployment_label
    namespace = "rashid"
  }
  spec {
    strategy {
      type = "RollingUpdate"
    }
    template {
      metadata {
        namespace = "rashid"
        labels    = var.deployment_label
      }
      spec {
        container {
          name  = "ssh-server"
          image = "marwaney/ssh-server"

        }
        node_name = "master"
      }

    }
    selector {
      match_labels = var.deployment_label
    }
    replicas = 3
  }
}

resource "kubernetes_service" "deploy_service" {
    depends_on = [ kubernetes_deployment.rashid-ssh-deployment ]
  metadata {
    name      = "rashid-ssh-deploy-service"
    namespace = "rashid"
    labels    = var.deployment_label
  }
  spec {
    selector = var.deployment_label
    type     = "NodePort"
    port {
      name = "deployssh"
      node_port   = "30812"
      target_port = 22
      port        = 22
    }
  }

}

