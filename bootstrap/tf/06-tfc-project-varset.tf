resource "tfe_variable_set" "aws_oidc" {
  organization = var.tf_organization_name
  name         = "OIDC variable set"
  description  = "AWS OIDC Variables"
}

resource "tfe_variable" "tfc_aws_provider_auth" {
  key             = "TFC_AWS_PROVIDER_AUTH"
  value           = "true"
  category        = "env"
  description     = "boolean to enable OIDC AWS provider auth"
  variable_set_id = tfe_variable_set.aws_oidc.id
}

resource "tfe_variable" "tfc_aws_run_role_arn" {
  sensitive       = true
  key             = "TFC_AWS_RUN_ROLE_ARN"
  value           = aws_iam_role.tf_project.arn
  category        = "env"
  description     = "IAM Role ARN to assume via OIDC auth"
  variable_set_id = tfe_variable_set.aws_oidc.id
}

resource "tfe_project_variable_set" "project_to_aws_oidc" {
  project_id      = tfe_project.this.id
  variable_set_id = tfe_variable_set.aws_oidc.id
}
