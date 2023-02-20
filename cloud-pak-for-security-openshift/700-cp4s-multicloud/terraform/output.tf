output "gitops-cp-catalogs_name" {
  description = "The name of the module"
  value = module.gitops-cp-catalogs.name
}
output "gitops-cp-catalogs_branch" {
  description = "The branch where the module config has been placed"
  value = module.gitops-cp-catalogs.branch
}
output "gitops-cp-catalogs_namespace" {
  description = "The namespace where the module will be deployed"
  value = module.gitops-cp-catalogs.namespace
}
output "gitops-cp-catalogs_server_name" {
  description = "The server where the module will be deployed"
  value = module.gitops-cp-catalogs.server_name
}
output "gitops-cp-catalogs_layer" {
  description = "The layer where the module is deployed"
  value = module.gitops-cp-catalogs.layer
}
output "gitops-cp-catalogs_type" {
  description = "The type of module where the module is deployed"
  value = module.gitops-cp-catalogs.type
}
output "gitops-cp-catalogs_catalog_ibmoperators" {
  description = "IBM Operator Catalog name"
  value = module.gitops-cp-catalogs.catalog_ibmoperators
}
output "gitops-cp-catalogs_catalog_commonservices" {
  description = "IBMCS Operators catalog name"
  value = module.gitops-cp-catalogs.catalog_commonservices
}
output "gitops-cp-catalogs_catalog_automationfoundation" {
  description = "IAF Core Operators catalog name"
  value = module.gitops-cp-catalogs.catalog_automationfoundation
}
output "gitops-cp-catalogs_catalog_processmining" {
  description = "IBM ProcessMining Operators catalog name"
  value = module.gitops-cp-catalogs.catalog_processmining
}
output "gitops-cp-catalogs_entitlement_key" {
  description = "Entitlement key"
  value = module.gitops-cp-catalogs.entitlement_key
  sensitive = true
}
output "gitops-cp4s_name" {
  description = "The name of the module"
  value = module.gitops-cp4s.name
}
output "gitops-cp4s_branch" {
  description = "The branch where the module config has been placed"
  value = module.gitops-cp4s.branch
}
output "gitops-cp4s_namespace" {
  description = "The namespace where the module will be deployed"
  value = module.gitops-cp4s.namespace
}
output "gitops-cp4s_server_name" {
  description = "The server where the module will be deployed"
  value = module.gitops-cp4s.server_name
}
output "gitops-cp4s_layer" {
  description = "The layer where the module is deployed"
  value = module.gitops-cp4s.layer
}
output "gitops-cp4s_type" {
  description = "The type of module where the module is deployed"
  value = module.gitops-cp4s.type
}
output "gitops-knative-serving_name" {
  description = "The name of the module"
  value = module.gitops-knative-serving.name
}
output "gitops-knative-serving_branch" {
  description = "The branch where the module config has been placed"
  value = module.gitops-knative-serving.branch
}
output "gitops-knative-serving_namespace" {
  description = "The namespace where the module will be deployed"
  value = module.gitops-knative-serving.namespace
}
output "gitops-knative-serving_server_name" {
  description = "The server where the module will be deployed"
  value = module.gitops-knative-serving.server_name
}
output "gitops-knative-serving_layer" {
  description = "The layer where the module is deployed"
  value = module.gitops-knative-serving.layer
}
output "gitops-knative-serving_type" {
  description = "The type of module where the module is deployed"
  value = module.gitops-knative-serving.type
}
output "cp4s-namespace_name" {
  description = "Namespace name"
  value = module.cp4s-namespace.name
}
output "operator-namespace_name" {
  description = "Namespace name"
  value = module.operator-namespace.name
}
output "knative-serving-namespace_name" {
  description = "Namespace name"
  value = module.knative-serving-namespace.name
}
output "gitops_repo_config_host" {
  description = "The host name of the bootstrap git repo"
  value = module.gitops_repo.config_host
}
output "gitops_repo_config_org" {
  description = "The org name of the bootstrap git repo"
  value = module.gitops_repo.config_org
}
output "gitops_repo_config_name" {
  description = "The repo name of the bootstrap git repo"
  value = module.gitops_repo.config_name
}
output "gitops_repo_config_project" {
  description = "The project name of the bootstrap git repo (for Azure DevOps)"
  value = module.gitops_repo.config_project
}
output "gitops_repo_config_repo" {
  description = "The repo that contains the argocd configuration"
  value = module.gitops_repo.config_repo
}
output "gitops_repo_config_repo_url" {
  description = "The repo that contains the argocd configuration"
  value = module.gitops_repo.config_repo_url
}
output "gitops_repo_config_ca_cert" {
  description = "The ca cert for the self-signed certificate used by the gitops repo"
  value = module.gitops_repo.config_ca_cert
}
output "gitops_repo_config_username" {
  description = "The username for the config repo"
  value = module.gitops_repo.config_username
}
output "gitops_repo_config_token" {
  description = "The token for the config repo"
  value = module.gitops_repo.config_token
  sensitive = true
}
output "gitops_repo_config_paths" {
  description = "The paths in the config repo"
  value = module.gitops_repo.config_paths
}
output "gitops_repo_config_projects" {
  description = "The ArgoCD projects for the different layers of the repo"
  value = module.gitops_repo.config_projects
}
output "gitops_repo_bootstrap_path" {
  description = "The path to the bootstrap configuration"
  value = module.gitops_repo.bootstrap_path
}
output "gitops_repo_bootstrap_branch" {
  description = "The branch in the gitrepo containing the bootstrap configuration"
  value = module.gitops_repo.bootstrap_branch
}
output "gitops_repo_application_repo" {
  description = "The repo that contains the application configuration"
  value = module.gitops_repo.application_repo
}
output "gitops_repo_application_repo_url" {
  description = "The repo that contains the application configuration"
  value = module.gitops_repo.application_repo_url
}
output "gitops_repo_application_username" {
  description = "The username for the application repo"
  value = module.gitops_repo.application_username
}
output "gitops_repo_application_token" {
  description = "The token for the application repo"
  value = module.gitops_repo.application_token
  sensitive = true
}
output "gitops_repo_application_paths" {
  description = "The paths in the application repo"
  value = module.gitops_repo.application_paths
}
output "gitops_repo_gitops_config" {
  description = "Config information regarding the gitops repo structure"
  value = module.gitops_repo.gitops_config
}
output "gitops_repo_git_credentials" {
  description = "The credentials for the gitops repo(s)"
  value = module.gitops_repo.git_credentials
  sensitive = true
}
output "gitops_repo_server_name" {
  description = "The name of the cluster that will be configured for gitops"
  value = module.gitops_repo.server_name
}
output "gitops_repo_sealed_secrets_cert" {
  description = "The certificate used to encrypt sealed secrets"
  value = module.gitops_repo.sealed_secrets_cert
}
output "gitops-serverless-operator_name" {
  description = "The name of the module"
  value = module.gitops-serverless-operator.name
}
output "gitops-serverless-operator_branch" {
  description = "The branch where the module config has been placed"
  value = module.gitops-serverless-operator.branch
}
output "gitops-serverless-operator_namespace" {
  description = "The namespace where the module will be deployed"
  value = module.gitops-serverless-operator.namespace
}
output "gitops-serverless-operator_server_name" {
  description = "The server where the module will be deployed"
  value = module.gitops-serverless-operator.server_name
}
output "gitops-serverless-operator_layer" {
  description = "The layer where the module is deployed"
  value = module.gitops-serverless-operator.layer
}
output "gitops-serverless-operator_type" {
  description = "The type of module where the module is deployed"
  value = module.gitops-serverless-operator.type
}
output "util-clis_bin_dir" {
  description = "Directory where the clis were downloaded"
  value = module.util-clis.bin_dir
}
