
include "root" {
  path = find_in_parent_folders()
}



dependency "cluster" {
  config_path = "${get_parent_terragrunt_dir()}/105-existing-openshift/terraform"
  skip_outputs = false

  mock_outputs_allowed_terraform_commands = ["validate", "init", "plan", "destroy", "output"]
  mock_outputs = {
    cluster_server_url = ""
    cluster_server_url = ""
    cluster_username = ""
    cluster_password = ""
    cluster_token = ""
  }
}


inputs = {
    server_url = dependency.cluster.outputs.cluster_server_url
    cluster_server_url = dependency.cluster.outputs.cluster_server_url
    cluster_login_user = dependency.cluster.outputs.cluster_username
    cluster_login_password = dependency.cluster.outputs.cluster_password
    cluster_login_token = dependency.cluster.outputs.cluster_token
}
