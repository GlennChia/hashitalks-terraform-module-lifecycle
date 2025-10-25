resource "aws_iam_openid_connect_provider" "hcp_terraform" {
  url = var.tf_url

  client_id_list = [
    "aws.workload.identity",
  ]
}

data "aws_iam_policy_document" "oidc_assume_role_policy" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.hcp_terraform.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${local.terraform_fqdn_no_protocol}:aud"
      values   = ["aws.workload.identity"]
    }

    condition {
      test     = "StringLike"
      variable = "${local.terraform_fqdn_no_protocol}:sub"
      values   = ["organization:${var.tf_organization_name}:project:${tfe_project.this.name}:workspace:*:run_phase:*"]
    }
  }
}

resource "aws_iam_role" "tf_project" {
  name_prefix        = "tf-module-lifecycle-demo"
  assume_role_policy = data.aws_iam_policy_document.oidc_assume_role_policy.json
}

data "aws_iam_policy" "administrator_access" {
  name = "AdministratorAccess"
}

resource "aws_iam_role_policy_attachment" "tf_project_administrator_access" {
  policy_arn = data.aws_iam_policy.administrator_access.arn
  role       = aws_iam_role.tf_project.name
}
