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
  default     = "Development"
  validation {
    condition     = contains(["Development", "Staging", "Production"], var.environment)
    error_message = "The environment must be one of 'Development', 'Staging', or 'Production'."
  }
}

variable "project_resources" {
  description = "A set of resources associated with the project."
  default     = []
  type        = set(string)
}
