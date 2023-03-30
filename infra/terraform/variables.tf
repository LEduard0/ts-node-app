
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

variable "private_envs" {
  type = map(string)
  description = "Private env variables"
}