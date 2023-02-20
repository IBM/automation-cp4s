
include "root" {
  path = find_in_parent_folders()
}



dependency "gitops" {
  config_path = "${get_parent_terragrunt_dir()}/200-openshift-gitops/terraform"
  skip_outputs = false

  mock_outputs_allowed_terraform_commands = ["validate", "init", "plan", "destroy", "output"]
  mock_outputs = {
    gitops_repo_config_host = ""
    gitops_repo_config_org = ""
    gitops_repo_config_name = ""
    gitops_repo_config_project = ""
    gitops_repo_config_username = ""
    gitops_repo_config_token = ""
  }
}


inputs = {
    gitops_host = dependency.gitops.outputs.gitops_repo_config_host
    gitops_org = dependency.gitops.outputs.gitops_repo_config_org
    gitops_repo = dependency.gitops.outputs.gitops_repo_config_name
    gitops_project = dependency.gitops.outputs.gitops_repo_config_project
    gitops_username = dependency.gitops.outputs.gitops_repo_config_username
    gitops_token = dependency.gitops.outputs.gitops_repo_config_token
}
