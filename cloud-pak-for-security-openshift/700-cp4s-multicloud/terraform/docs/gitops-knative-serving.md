# Knative Serving module

Module to populate a gitops repo with the resources to provision knative-serving


## Software dependencies

The module depends on the following software components:

### Terraform version

- \>= v0.15

### Terraform providers


- gitops (cloud-native-toolkit/gitops)

### Module dependencies


- gitops - [github.com/cloud-native-toolkit/terraform-tools-gitops.git](https://github.com/cloud-native-toolkit/terraform-tools-gitops.git) (>= 1.1.0)
- namespace - [github.com/cloud-native-toolkit/terraform-gitops-namespace.git](https://github.com/cloud-native-toolkit/terraform-gitops-namespace.git) (>= 1.0.0)
- serverless-operator - [github.com/cloud-native-toolkit/terraform-gitops-serverless-operator.git](https://github.com/cloud-native-toolkit/terraform-gitops-serverless-operator.git) (>= 1.0.0)

## Example usage

```hcl
module "gitops-knative-serving" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-knative-serving"

  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  instance_name = var.gitops-knative-serving_instance_name
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  namespace = module.knative-serving-namespace.name
  replica_count = var.gitops-knative-serving_replica_count
  server_name = module.gitops_repo.server_name
}

```

## Module details

### Inputs

| Name | Description | Required | Default | Source |
|------|-------------|---------|----------|--------|
| gitops_config | Config information regarding the gitops repo structure | true |  | gitops.gitops_config |
| git_credentials | The credentials for the gitops repo(s) | true |  | gitops.git_credentials |
| namespace | The namespace where the application should be deployed | true |  | namespace.name |
| kubeseal_cert | The certificate/public key used to encrypt the sealed secrets | true |  | gitops.sealed_secrets_cert |
| server_name | The name of the server | false | default | gitops.server_name |
| replica_count | The number of replcas for the Knative Serving instance | false | 2 |  |
| instance_name | The name of the Knative Serving instance | false | knative-serving |  |

### Outputs

| Name | Description |
|------|-------------|
| name | The name of the module |
| branch | The branch where the module config has been placed |
| namespace | The namespace where the module will be deployed |
| server_name | The server where the module will be deployed |
| layer | The layer where the module is deployed |
| type | The type of module where the module is deployed |

## Resources

- [Documentation](https://operate.cloudnativetoolkit.dev)
- [Module catalog](https://modules.cloudnativetoolkit.dev)

> License: Apache License 2.0 | Generated by iascable (3.1.0)