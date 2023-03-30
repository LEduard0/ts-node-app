variable "acls" {
  type = list(
    object({
      host = string
      port = optional(number, 443)
    })
  )

  description = "App acls"
  default     = []
}
