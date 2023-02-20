# 105-existing-openshift

Existing OpenShift cluster

## Running the automation

This terraform template is part of collection of layers that should be executed together. Before this layer
can be applied, several steps must first be taken:

1. Run `apply.sh` in the parent directory to generate the input variable configuration for the run. If you'd like to apply one layer at a time, select `n` when prompted to continue.
2. Run `apply.sh` for each of the layer dependencies listed below.
3. Run `apply.sh` for this layer.

## Contents

### Layer dependencies


No dependencies

### Modules

| Name | Description | Version |
|------|-------------|---------|
| [ocp-login](https://github.com/cloud-native-toolkit/terraform-ocp-login) | Module to perform a simple cluster login and provide the cluster path | v1.6.2 |

### Variables

| Name | Description | Sensitive | Default value |
|------|-------------|-----------|---------------|
| server_url | The url for the OpenShift api |  |  |
| cluster_login_token | Token used for authentication | true |  |

## Troubleshooting

