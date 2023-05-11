locals {
  terratag_added_main = { "Environment" = "${var.environment}", "ManagedBy" = "Terraform" }
}


resource "aws_ecr_repository" "repository" {
  name                 = "${var.registry_name}-${var.environment}"
  image_tag_mutability = "MUTABLE"
  force_delete         = var.repository_force_delete

  tags = merge({
    "Name" = var.registry_name
  }, local.terratag_added_main)

  image_scanning_configuration {
    scan_on_push = true
  }
}