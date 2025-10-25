resource "tfe_registry_module" "demo" {
  depends_on = [github_release.network_module_v1_0_0]

  organization = var.tf_organization_name

  vcs_repo {
    tags               = true
    display_identifier = github_repository.network_module.full_name
    identifier         = github_repository.network_module.full_name
    oauth_token_id     = tfe_oauth_client.github.oauth_token_id
  }
}
