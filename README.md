# cloud-pak-for-security-openshift

Automation to deploy IBM Cloud Pak for Security on Top of RedHat OpenShift.

## Prerequisites

This automation is expected to deploy into an existing OpenShift cluster.  Be sure to review Cloud Pak for Security [system requirements](https://www.ibm.com/docs/en/cloud-paks/cp-security/1.9?topic=planning-system-requirements) and [storage requirements](https://www.ibm.com/docs/en/cloud-paks/cp-security/1.9?topic=planning-storage-requirements) to ensure you have an adequate cluster configuration.

If you do not have an OpenShift cluster, you can use terraform automation to provision an environment for you:
- [IBM Cloud](https://github.com/IBM/automation-ibmcloud-infra-openshift)
- [AWS](https://github.com/IBM/automation-aws-infra-openshift)
- [Azure](https://github.com/IBM/automation-azure-infra-openshift)


## Post Installation Tasks

After completing the terraform automation, the following tasks must be completed manually:

- [Configuring Identity Providers](https://www.ibm.com/docs/en/cloud-paks/cp-security/1.9?topic=postinstallation-configuring-identity-providers)
- [Logging in as the initial user](https://www.ibm.com/docs/en/cloud-paks/cp-security/1.9?topic=postinstallation-logging-in-cloud-pak-security-as-initial-user)
- [Installing Orchestration and Automation license](https://www.ibm.com/docs/en/cloud-paks/cp-security/1.9?topic=postinstallation-installing-orchestration-automation-license)
- If using IBM Cloud Security Advisor, [Configure the IBM Cloud Security Advisor Adapter](https://www.ibm.com/docs/en/cloud-paks/cp-security/1.9?topic=postinstallation-cloud-security-advisor-adapter)

## Running the automation

There are three different options for how to configure and run the automation:

- Interactive prompts
- Yaml configuration
- Terraform configuration

### Interactive prompts

In this mode, you will be prompted interactively for the variables required to run the automation.

1. From a command line terminal, run `launch.sh`.  This will start a container-zed shell that has all of the dependencies preinstalled.
2. `cd` into the `cloud-pak-for-security-openshift` directory.
3. Run the `apply.sh` script
4. At each prompt, provide a value for the variable.
5. Once all the variables are collected, you will be asked to apply the automation. Enter `y` to continue or `n` to stop. Either way, the values provided have been collected and written to two sets of files so that next time you can skip the prompts.

The `apply.sh` script will generate credentials.yaml and variables.yaml input files that can be used
for future deployments as well as generating the credentials.auto.tfvars and terraform.tfvars files
used by the terraform. The variables.yaml and terraform.tfvars files can be checked in with the terraform
templates. However, credentials.yaml and credentials.auto.tfvars should be excluded since they contain
sensitive information. Those files should already be included in the .gitignore file.

### Yaml configuration

In this mode, you provide the configuration for your instance in yaml configuration files and avoid
the prompts.

1. Copy the variables.template.yaml file to variables.yaml and credentials.template.yaml to credentials.yaml.
2. Provide values for each of the variables in variables.yaml and credentials.yaml.
3. Run `apply.sh --ci` to kick off the automation. You will not be prompted for input variables and the automation will start immediately

The `apply.sh` script will generate the credentials.auto.tfvars and terraform.tfvars files from the
values provided in the yaml files. The variables.yaml and terraform.tfvars files can be checked in with the terraform
templates. However, credentials.yaml and credentials.auto.tfvars should be excluded since they contain
sensitive information. Those files should already be included in the .gitignore file.

### Terraform configuration

In situations where you are comfortable working with the terraform directly, you can skip the yaml
configuration files and directly configure the automation with the terraform configuration files.

1. Copy the variables.template.tfvars file and credentials.auto.template.tfvars to variables.tfvars and credentials.auto.tfvars, respectively.
2. Provide values for the different variables in variables.tfvars and credentials.auto.tfvars.
3. Kick off the automation with `apply.sh --ci` or skip the script and run `terragrunt run-all apply --terragrunt-parallelism 1 --terragrunt-non-interactive`

The terraform.tfvars file can be checked in with the terraform templates. However, credentials.auto.tfvars
should be excluded since it contains sensitive information. The credentials.auto.tfvars file should
already be in .gitignore.

## Contents

### Layers

| Name | Layer | Description | Version |
|------|-------|-------------|---------|
| [105-existing-openshift](./105-existing-openshift) | infrastructure | Existing OpenShift cluster | v1.0.1 |
| [200-openshift-gitops](./200-openshift-gitops) | software | Provisions OpenShift GitOps (ArgoCD) into an existing cluster and bootstraps it to a gitops repository | v1.0.1 |
| [700-cp4s-multicloud](./700-cp4s-multicloud) | software | Populates a GitOps repository with the components of IBM Cloud Pak for Security | v1.0.2 |

### Variables
| Name | Description | Sensitive | Default value |
|------|-------------|-----------|---------------|
| cluster_ingress_subdomain |  |  |  |
| cluster_login_token | Token used for authentication | true |  |
| config_banner_text | The text that will appear in the top banner in the cluster |  |  |
| entitlement_key |  | true |  |
| gitops_repo_repo | The short name of the repository (i.e. the part after the org/group name) |  |  |
| gitops-cp4s_admin_user | Short name or email-id of the user to be given administrator privileges in the default account. Mandatory value while creating cp4s-threat-management-instance | true |  |
| gitops-cp4s_roks_auth | Whether ROKS (RedHat OpenShift on IBM Cloud) authentication need to be enabled (true|false) |  |  |
| server_url | The url for the OpenShift api |  |  |
| gitops_repo_host | The host for the git repository. The git host used can be a GitHub, GitHub Enterprise, Gitlab, Bitbucket, Gitea or Azure DevOps server. If the host is null assumes in-cluster Gitea instance will be used. |  |  |
| gitops_repo_org | The org/group where the git repository exists/will be provisioned. If the value is left blank then the username org will be used. |  |  |
| gitops_repo_project | The project that will be used for the git repo. (Primarily used for Azure DevOps repos) |  |  |
| gitops_repo_token | The personal access token used to access the repository | true |  |
| gitops_repo_username | The username of the user with access to the repository |  |  |

## Troubleshooting

IF using the `apply.sh` script in the root and using Gitea for the gitops repo (in-cluster), it is common to see an error in between execution of the 200 and 700 layers indicating that the git repo could not be reached.   This is due to a timing issue, where the automation attempts to configure the software gitops repo before Gitea has finished initializing.  If you encounter this error, re-run the `apply.sh` script and it should proceed without any issues.