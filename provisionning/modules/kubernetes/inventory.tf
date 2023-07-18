variable "path" {
  type = string
  default = "/home/haruna/automation/configuration/group_vars"
}

resource "null_resource" "inventory" {
  depends_on = [kubernetes_deployment.rashid-ssh-deployment, kubernetes_pod.single_pod, kubernetes_service.deploy_service, kubernetes_service.single_pod_service]
  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command     = "echo -e 'port:${kubernetes_service.single_pod_service.spec[0].port[0].node_port}' > ${var.path}/group_pod.yml && echo -e 'port:${kubernetes_service.deploy_service.spec[0].port[0].node_port}' > ${var.path}/group_deploy.yml && echo -e '[all:vars]\nansible_host=149.100.159.199\n[group_pod]\n[group_deploy] > /home/haruna/automation/configuration/inventory "
  }
}
