# 200-openshift-gitops

Provisions OpenShift GitOps (ArgoCD) into an existing cluster and bootstraps it to a gitops repository

## Running the automation

This terraform template is part of collection of layers that should be executed together. Before this layer
can be applied, several steps must first be taken:

1. Run `apply.sh` in the parent directory to generate the input variable configuration for the run. If you'd like to apply one layer at a time, select `n` when prompted to continue.
2. Run `apply.sh` for each of the layer dependencies listed below.
3. Run `apply.sh` for this layer.

## Contents

### Layer dependencies


The following layers are dependencies of this terraform template and must be applied before this one.
- [cluster](../105-existing-openshift)

### Modules

| Name | Description | Version |
|------|-------------|---------|
| [namespace](https://github.com/cloud-native-toolkit/terraform-k8s-namespace) | Creates a namespace in the cluster | v3.2.4 |
| [gitea](https://github.com/cloud-native-toolkit/terraform-tools-gitea) | Module to install Gitea into a cluster via an operator | v0.5.1 |
| [gitops-cluster-config](https://github.com/cloud-native-toolkit/terraform-gitops-cluster-config) | Module to populate a gitops repository with base configuration of the Red Hat OpenShift cluster (notification banner, help menus, etc) | v1.1.1 |
| [gitops-console-link-job](https://github.com/cloud-native-toolkit/terraform-gitops-console-link-job) | Module that populates a gitops repository with the Console Link Cronjob chart from https://charts. | v1.5.1 |
| [gitops-namespace](https://github.com/cloud-native-toolkit/terraform-gitops-namespace) | Module to configure the provisioning of a namespace in a GitOps repo | v1.12.2 |
| [gitops-repo](https://github.com/cloud-native-toolkit/terraform-tools-gitops) | Module to provision and set up a GitOps repository | v1.23.3 |
| [argocd-bootstrap](https://github.com/cloud-native-toolkit/terraform-tools-argocd-bootstrap) | Module to provision ArgoCD and bootstrap an application using the GitOps repo | v1.13.0 |
| [ocp-login](https://github.com/cloud-native-toolkit/terraform-ocp-login) | Module to perform a simple cluster login and provide the cluster path | v1.6.2 |
| [olm](https://github.com/cloud-native-toolkit/terraform-k8s-olm) | Installs Operator Lifecycle Manager in the cluster | v1.3.5 |
| [util-clis](https://github.com/cloud-native-toolkit/terraform-util-clis) | Module to install clis into local bin directory | v1.18.2 |
| [sealed-secret-cert](https://github.com/cloud-native-toolkit/terraform-util-sealed-secret-cert) | Module to collect or generate the certificate and private key used for the sealed secret component | v1.0.1 |

### Variables

| Name | Description | Sensitive | Default value |
|------|-------------|-----------|---------------|
| config_banner_text | The text that will appear in the top banner in the cluster |  |  |
| gitops_repo_host | The host for the git repository. The git host used can be a GitHub, GitHub Enterprise, Gitlab, Bitbucket, Gitea or Azure DevOps server. If the host is null assumes in-cluster Gitea instance will be used. |  |  |
| gitops_repo_org | The org/group where the git repository exists/will be provisioned. If the value is left blank then the username org will be used. |  |  |
| gitops_repo_project | The project that will be used for the git repo. (Primarily used for Azure DevOps repos) |  |  |
| gitops_repo_username | The username of the user with access to the repository |  |  |
| gitops_repo_token | The personal access token used to access the repository | true |  |
| gitops_repo_repo | The short name of the repository (i.e. the part after the org/group name) |  |  |
| server_url | The url for the OpenShift api |  |  |
| cluster_login_token | Token used for authentication | true |  |

## Troubleshooting

