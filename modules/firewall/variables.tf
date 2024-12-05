variable "name" {}
variable "inbound_rules" {
  type = list(object({
    protocol = string
    port     = string
    source   = string
  }))
}

variable "outbound_rules" {
  type = list(object({
    protocol = string
  }))
}

variable "droplet_ids" {
  type = list(string)
}