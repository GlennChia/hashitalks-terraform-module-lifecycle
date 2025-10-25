variable "tf_organization_name" {
  description = "Terraform Organization name to deploy workspaces, teams, notifications into."
  type        = string
}

variable "tf_url" {
  type        = string
  description = "Terraform Cloud URL or Terraform Enterprise FQDN"
  default     = "https://app.terraform.io"
}

variable "organization_membership_email_workspace_v1_0_0" {
  description = "The email for the Organization member for workspace that uses v1.0.0 of the module"
  type        = string
}

variable "organization_membership_email_workspace_v1_1_0" {
  description = "The email for the Organization member for workspace that uses v1.1.0 of the module"
  type        = string
}

variable "organization_membership_email_workspace_v2_0_0" {
  description = "The email for the Organization member for workspace that uses v2.0.0 of the module"
  type        = string
}

variable "github_token" {
  description = "A GitHub OAuth / Personal Access Token. When not provided or made available via the GITHUB_TOKEN environment variable, the provider can only access resources available anonymously"
  type        = string
}