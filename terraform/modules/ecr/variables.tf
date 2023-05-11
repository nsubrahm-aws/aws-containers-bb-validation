variable "environment" {
  description = "Deployment Environment"
  type        = string
}

variable "registry_name" {
  description = "The name of the registry."
  type        = string
}

variable "repository_force_delete" {
  description = "Whether to force delete the repository."
  type        = bool
}