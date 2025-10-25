locals {
  github_branch              = "main"
  terraform_fqdn_no_protocol = split("//", var.tf_url)[1]
}