provider "gitlab" {
  # Configuration options
  token = var.gitlab_token
}
locals {
  users = split("\n", file(var.user_file_path))
}

resource "gitlab_user" "users" {
  for_each = { for user in local.users : user => user }

  email            = "${each.key}@gmail.com"
  name             = each.key
  username         = each.key
  password         = random_password.password.result
  is_admin         = false
  projects_limit   = 4
  can_create_group = false
  is_external      = false
  reset_password   = true
}

resource "random_password" "password" {
  length  = 16
  special = true
}

resource "gitlab_project_membership" "members" {
  for_each = { for user in local.users : user => user }

  user_id      = gitlab_user.users[each.key].id
  project_id   = var.gitlab_project_id
  access_level = "developer"
}


# Add a project owned by the user
resource "gitlab_project" "sample_project" {
  name                   = "created-by-terraform"
  description            = "Terraform Project"
  initialize_with_readme = true
}

