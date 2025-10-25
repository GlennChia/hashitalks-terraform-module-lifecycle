resource "tfe_project" "this" {
  organization = var.tf_organization_name
  name         = "demo-project"
}
