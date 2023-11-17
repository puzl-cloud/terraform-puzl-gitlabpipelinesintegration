# Example Usage of GitLab Pipelines Integration Module

## Introduction

This example demonstrates how to use the GitLab Pipelines Integration Terraform module.

## Prerequisites

- Terraform v1.3.0 or higher.
- Access to https://gitlab-pipelines.puzl.cloud/dashboard.
- A GitLab instance (either gitlab.com or a self-hosted GitLab).

## Usage

1. Create credetial on https://gitlab-pipelines.puzl.cloud/dashboard
2. Update the `main.tf` file with your specific details, such as the GitLab URL and desired namespace.
3. Set `KUBE_HOST` and `KUBE_TOKEN` enviroment varibale.
4. Initialize the Terraform environment:

```bash
terraform init
terraform plan
```

5. Apply the Terraform configuration:

```bash
terraform apply
```

## Cleanup

To remove the deployed resources, run:

```bash
terraform destroy
```