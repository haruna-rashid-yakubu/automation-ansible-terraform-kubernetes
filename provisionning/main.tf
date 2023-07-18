terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~>5.28.0"
    }
    kubernetes = {
      source = "kubernetes"
    }
  }
  backend "kubernetes" {
    secret_suffix = "automation2"
    config_path   = "~/.kube/config"
  }
}

data "terraform_remote_state" "name" {
  backend = "kubernetes"
  config = {
    secret_suffix = "automation2"
    config_path   = "~/.kube/config"
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

# provider "github" {
#   token = var.token
# }

module "kubernetes" {
  source = "./modules/kubernetes"
}
module "github" {
  source = "./modules/github"
}

