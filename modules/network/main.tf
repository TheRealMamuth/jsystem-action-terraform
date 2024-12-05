resource "digitalocean_vpc" "vpc" {
  name        = "${var.vpc_name}"
  region      = "${var.vpc_region}"
  description = "${var.vpc_description}"
  ip_range    = "${var.vpc_ip_range}"
}