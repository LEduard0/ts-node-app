
variable "pool_name" {
  description = "Pool Name"
}

variable "team_owner" {
  description = "Team Owner"
}

variable "public_envs" {
  type = map(string)
  description = "Public env variables"
}

variable "service_name" {
  description = "Service name"
}

variable "instance_name" {
  description = "Service instance name"
}