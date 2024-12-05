variable "vms" {
  description = "parametry maszyn wirtualnych"
  type = map(object({
    id     = string
    name   = string
    region = string
    size   = string
    image  = string
    tags   = list(string)
  }))
  default = {
    "vm1" = {
      "id"     = "pk1",
      "name"   = "cw2-vm",
      "region" = "fra1",
      "image"  = "ubuntu-20-04-x64",
      "size"   = "s-1vcpu-1gb",
      "tags"   = ["cw2", "tz", "development"]
    },
  }
}
variable "ssh_key_id" {
  description = "key ssh"
  type        = string
}

variable "vpc_uuid" {
  description = "network uuid "
  type        = string
}