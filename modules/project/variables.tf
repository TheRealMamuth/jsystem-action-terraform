variable "do_token" {
  description = "digital ocean token"
}

variable "project_name" {
  description = "Name of the project"
  default     = "defaultprojectname"
}

variable "project_description" {
  description = "Description of the project"
  default     = "Test description"
}

variable "project_purpose" {
  description = "Purpose of the project"
  default     = "Demo purpose"
}

variable "environment" {
  description = "The environment in which the project is deployed."
  default     = "dev"
}

variable "project_resources" {
  description = "A set of resources associated with the project."
  type        = set(string)
}
