terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}
provider "docker" {
  alias = "test"
  host  = "unix:///var/run/docker.sock"
  registry_auth {
    address     = "registry-1.docker.io"
    config_file = pathexpand("~/.docker/config.json")
    username    = var.docker_cred.user
    password    = var.docker_cred.password
  }
}

resource "docker_image" "image" {
  name = "registry-1.docker.io/marwaney/ssh-server:terraform"
  build {
    context = "../../conteneurisation"
  }
}

resource "docker_registry_image" "image" {
  name          = docker_image.image.name
  keep_remotely = true
}

resource "docker_container" "test" {
  name  = "test-ct"
  image = "marwaney/ssh-server:latest"
  ports {
    internal = 22
    external = 8900
  }
}
