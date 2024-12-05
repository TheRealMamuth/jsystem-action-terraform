
resource "digitalocean_project" "main" {
  name        = var.project_name
  description = var.project_description
  purpose     = var.project_purpose
  environment = var.environment

  resources = var.project_resources
}