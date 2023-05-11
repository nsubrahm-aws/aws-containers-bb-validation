include "backend" {
  path = find_in_parent_folders("backend.hcl")
}

include "version" {
  path = find_in_parent_folders("version.hcl")
}

include "region" {
  path = find_in_parent_folders("region.hcl")
}

include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

terraform {
  source = "../../../../modules/ecr"
}

inputs = {
  environment             = include.root.inputs.environment
  registry_name           = include.root.inputs.registry_name
  repository_force_delete = include.root.inputs.repository_force_delete
}