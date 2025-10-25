# Workspace 1
resource "tfe_team" "workspace_v1_0_0" {
  organization = var.tf_organization_name
  name         = "workspace-v1-0-0"
}

# Workspace not created yet
# resource "tfe_team_access" "workspace_v1_0_0" {
#   access       = "read"
#   team_id      = tfe_team.workspace_v1_0_0.id
#   workspace_id = tfe_workspace.v1_0_0.id
# }

resource "tfe_organization_membership" "workspace_v1_0_0" {
  organization = var.tf_organization_name
  email        = var.organization_membership_email_workspace_v1_0_0
}

resource "tfe_team_organization_member" "workspace_v1_0_0" {
  team_id                    = tfe_team.workspace_v1_0_0.id
  organization_membership_id = tfe_organization_membership.workspace_v1_0_0.id
}

# Workspace 2
resource "tfe_team" "workspace_v1_1_0" {
  organization = var.tf_organization_name
  name         = "workspace-v1-1-0"
}

# Workspace not created yet
# resource "tfe_team_access" "workspace_v1_1_0" {
#   access       = "read"
#   team_id      = tfe_team.workspace_v1_1_0.id
#   workspace_id = tfe_workspace.v1_1_0.id
# }

resource "tfe_organization_membership" "workspace_v1_1_0" {
  organization = var.tf_organization_name
  email        = var.organization_membership_email_workspace_v1_1_0
}

resource "tfe_team_organization_member" "workspace_v1_1_0" {
  team_id                    = tfe_team.workspace_v1_1_0.id
  organization_membership_id = tfe_organization_membership.workspace_v1_1_0.id
}

# Workspace 3
resource "tfe_team" "workspace_v2_0_0" {
  organization = var.tf_organization_name
  name         = "workspace-v2-0-0"
}

# Workspace not created yet
# resource "tfe_team_access" "workspace_v2_0_0" {
#   access       = "read"
#   team_id      = tfe_team.workspace_v2_0_0.id
#   workspace_id = tfe_workspace.v2_0_0.id
# }

resource "tfe_organization_membership" "workspace_v2_0_0" {
  organization = var.tf_organization_name
  email        = var.organization_membership_email_workspace_v2_0_0
}

resource "tfe_team_organization_member" "workspace_v2_0_0" {
  team_id                    = tfe_team.workspace_v2_0_0.id
  organization_membership_id = tfe_organization_membership.workspace_v2_0_0.id
}
