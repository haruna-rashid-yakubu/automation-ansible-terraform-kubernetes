terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~>5.28.0"
    }
    kubernetes = {
      source = "kubernetes"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
  backend "kubernetes" {
    secret_suffix = "automation"
    config_path   = "~/.kube/config"
  }
}

data "terraform_remote_state" "name" {
  backend = "kubernetes"
  config = {
    secret_suffix = "automation"
    config_path   = "~/.kube/config"
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
  registry_auth {
    address     = "registry-1.docker.io"
    config_file = pathexpand("~/.docker/config.json")
    username = var.docker_cred.user
    password = var.docker_cred.password
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "github" {
  token = var.token
}

resource "github_repository" "repository" {
  name        = var.repo_info.name
  description = var.repo_info.description
  visibility  = var.repo_info.visibility
}

resource "docker_image" "image" {
  name = "registry-1.docker.io/marwaney/ssh-server"
  build {
    context = "."
  }
}

resource "docker_registry_image" "image" {
  name          = docker_image.image.name
  keep_remotely = true
}

