variable "repo_info" {
  type = object({
    name        = string
    description = string
    visibility  = string
  })
  default = {
    name        = "automation-ansible-terraform-kubernetes"
    description = "this repository is made by haruna rashid and include terraform script, ansible script , bash and kuberntes orchestration through terraform"
    visibility  = "public"
  }
}
variable "token" {
  type        = string
  sensitive   = true
   default = "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"
  description = "token de connexion a github"
}
