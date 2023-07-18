resource "github_repository" "repository" {
  name        = var.repo_info.name
  description = var.repo_info.description
  visibility  = var.repo_info.visibility
}


