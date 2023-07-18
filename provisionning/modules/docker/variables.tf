
variable "docker_cred" {
 type = object({
   user = string
   password = string
 })
 sensitive = true
 default = {
   user = "marwaney"
   password = "Allahouakbar2002"
 }
}