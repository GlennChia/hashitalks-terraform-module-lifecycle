# Module
resource "github_repository" "network_module" {
  name               = "terraform-aws-network"
  description        = "repo created containing a simple network"
  auto_init          = true # produces an initial commit
  gitignore_template = "Terraform"
  visibility         = "private"
}

resource "github_repository_file" "network_module_main_v_1_0_0_tf" {
  repository          = github_repository.network_module.name
  branch              = local.github_branch
  commit_message      = "feat: main"
  overwrite_on_create = true
  file                = "main.tf"
  content             = file("../tf-github-bootstrap-module/main_v1_0_0.tf")
}

resource "github_release" "network_module_v1_0_0" {
  repository       = github_repository.network_module.name
  tag_name         = "v1.0.0"
  target_commitish = github_repository_file.network_module_main_v_1_0_0_tf.commit_sha
  name             = "v1.0.0"
  body             = "version v1.0.0"
  draft            = false
  prerelease       = false
}

# Workspace 1
resource "github_repository" "workspace_v1_0_0" {
  name               = "workspace-v1-0-0-module"
  description        = "repo created containing a module that uses PMR module v1.0.0"
  auto_init          = true # produces an initial commit
  gitignore_template = "Terraform"
  visibility         = "private"
}

resource "github_repository_file" "workspace_v1_0_0_main_tf" {
  repository          = github_repository.workspace_v1_0_0.name
  branch              = local.github_branch
  commit_message      = "feat: network config"
  overwrite_on_create = true
  file                = "main.tf"
  content             = file("../tf-github-bootstrap-workspace/main_v1_0_0.tf")
}

# Workspace 2
resource "github_repository" "workspace_v1_1_0" {
  name               = "workspace-v1-1-0-module"
  description        = "repo created containing a module that uses PMR module v1.1.0"
  auto_init          = true # produces an initial commit
  gitignore_template = "Terraform"
  visibility         = "private"
}

resource "github_repository_file" "workspace_v1_1_0_main_tf" {
  repository          = github_repository.workspace_v1_1_0.name
  branch              = local.github_branch
  commit_message      = "feat: network config"
  overwrite_on_create = true
  file                = "main.tf"
  content             = file("../tf-github-bootstrap-workspace/main_v1_1_0.tf")
}

# Workspace 3
resource "github_repository" "workspace_v2_0_0" {
  name               = "workspace-v2-0-0-module"
  description        = "repo created containing a module that uses PMR module v2.0.0"
  auto_init          = true # produces an initial commit
  gitignore_template = "Terraform"
  visibility         = "private"
}

resource "github_repository_file" "workspace_v2_0_0_main_tf" {
  repository          = github_repository.workspace_v2_0_0.name
  branch              = local.github_branch
  commit_message      = "feat: network config"
  overwrite_on_create = true
  file                = "main.tf"
  content             = file("../tf-github-bootstrap-workspace/main_v2_0_0.tf")
}
