output "vpc_id" {
  value       = digitalocean_vpc.vpc.id
  description = "ID of vpc"
}