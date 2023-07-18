locals {
  name = "rashid"
}

variable "single_pod" {
  type = list(object({
    pod_name  = string
    container = string
  }))

  default = [{
    pod_name  = "rashid-pod-1"
    container = "rashid-ssh-1"
    },
    {
      pod_name  = "rashid-pod-2"
      container = "rashid-ssh-2"
    },
    {
      pod_name  = "rashid-pod-3"
      container = "rashid-ssh-3"
    },

  ]
}

variable "pod_label" {
  type = map(string)
  default = {
    owner = "harouna"
    type  = "ssh"
    app   = "mayapp"
  }
}

variable "deployment_label" {
  type = map(string)
  default = {
    owner = "harouna"
    type  = "ssh"
    app   = "deploy"
  }
}
