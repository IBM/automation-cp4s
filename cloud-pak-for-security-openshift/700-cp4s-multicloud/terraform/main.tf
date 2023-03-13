module "cp4s-namespace" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-namespace?ref=v1.15.0"

  argocd_namespace = var.cp4s-namespace_argocd_namespace
  branch = var.cp4s-namespace_branch
  ci = var.cp4s-namespace_ci
  create_operator_group = var.cp4s-namespace_create_operator_group
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  name = var.cp4s-namespace_name
  server_name = module.gitops_repo.server_name
}
module "gitops_repo" {
  source = "github.com/cloud-native-toolkit/terraform-tools-gitops?ref=v1.23.3"

  branch = var.gitops_repo_branch
  debug = var.debug
  gitea_host = var.gitops_repo_gitea_host
  gitea_org = var.gitops_repo_gitea_org
  gitea_token = var.gitops_repo_gitea_token
  gitea_username = var.gitops_repo_gitea_username
  gitops_namespace = var.gitops_repo_gitops_namespace
  host = var.gitops_repo_host
  org = var.gitops_repo_org
  project = var.gitops_repo_project
  public = var.gitops_repo_public
  repo = var.gitops_repo_repo
  sealed_secrets_cert = var.gitops_repo_sealed_secrets_cert
  server_name = var.gitops_repo_server_name
  strict = var.gitops_repo_strict
  token = var.gitops_repo_token
  type = var.gitops_repo_type
  username = var.gitops_repo_username
}
module "gitops-cp-catalogs" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-cp-catalogs?ref=v1.2.7"

  entitlement_key = var.entitlement_key
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  server_name = module.gitops_repo.server_name
}
module "gitops-cp4s" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-cp4s?ref=v1.1.5"

  admin_user = var.gitops-cp4s_admin_user
  backup_storage_class = var.rwo_storage_class
  backup_storage_size = var.gitops-cp4s_backup_storage_size
  catalog = module.gitops-cp-catalogs.catalog_ibmoperators
  catalog_namespace = var.gitops-cp4s_catalog_namespace
  channel = var.gitops-cp4s_channel
  domain = var.gitops-cp4s_domain
  entitlement_key = module.gitops-cp-catalogs.entitlement_key
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  namespace = module.cp4s-namespace.name
  orchestration_automation_license = var.gitops-cp4s_orchestration_automation_license
  roks_auth = var.gitops-cp4s_roks_auth
  server_name = module.gitops_repo.server_name
  storage_class = var.rwo_storage_class
}
module "gitops-knative-serving" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-knative-serving?ref=v1.0.1"

  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  instance_name = var.gitops-knative-serving_instance_name
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  namespace = module.knative-serving-namespace.name
  replica_count = var.gitops-knative-serving_replica_count
  server_name = module.gitops_repo.server_name
}
module "gitops-serverless-operator" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-serverless-operator?ref=v1.0.2"

  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  namespace = module.operator-namespace.name
  server_name = module.gitops_repo.server_name
}
module "knative-serving-namespace" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-namespace?ref=v1.15.0"

  argocd_namespace = var.knative-serving-namespace_argocd_namespace
  branch = var.knative-serving-namespace_branch
  ci = var.knative-serving-namespace_ci
  create_operator_group = var.knative-serving-namespace_create_operator_group
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  name = var.knative-serving-namespace_name
  server_name = module.gitops_repo.server_name
}
module "operator-namespace" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-namespace?ref=v1.15.0"

  argocd_namespace = var.operator-namespace_argocd_namespace
  branch = var.operator-namespace_branch
  ci = var.operator-namespace_ci
  create_operator_group = var.operator-namespace_create_operator_group
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  name = var.operator-namespace_name
  server_name = module.gitops_repo.server_name
}
module "util-clis" {
  source = "cloud-native-toolkit/clis/util"
  version = "1.18.2"

  bin_dir = var.util-clis_bin_dir
  clis = var.util-clis_clis == null ? null : jsondecode(var.util-clis_clis)
}
