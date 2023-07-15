variable "token" {
  type        = string
  sensitive   = true
  description = "token de connexion a github"
}

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

variable "docker_cred" {
 type = object({
   user = string
   password = string
 })
 sensitive = true
}