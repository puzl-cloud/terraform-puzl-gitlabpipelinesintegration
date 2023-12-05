# puzl.cloud Terraform module for GitLab Integration

## Overview

This Terraform module is designed to connect your GitLab instance with [Cloud Pipelines Service](https://gitlab-pipelines.puzl.cloud) by Puzl. One Integration scopes one team or department within your organization and might enable its owner or maintainer to set up and manage runners for executing their pipeline jobs.

Administrator (owner of Puzl account) creates Integrations in their Puzl root namespace, which can be found in [Puzl dashboard](https://gitlab-pipelines.puzl.cloud/dashboard/integrations) after account creation. The detailed description of the fields used in this module can be found in the related [GitLab Integration documentation](https://gitlab-pipelines.puzl.cloud/docs/api/custom-puzl-resources/gitlab-pipelines-integration/).

## Features

- Management of GitLab Integrations.
- Outputs the name of Claim Namespace where the GitLab Runners can be claimed.

## Requirements

- Terraform v1.3.0 or higher.
- Kubernetes provider v2.23.0 or higher.

## Usage

To use this module in your Terraform environment, add the following configuration:

```hcl
locals {
  gitlab_url           = "https://gitlab.com"
  integration_name     = "gitlab-group-integration"
  root_namespace       = "root-cysexkwsk57xtlabdkyn3zpybzslt2l7frtwj5arfodtz"
}

module "integration" {
  source     = "puzl-cloud/gitlabpipelinesintegration/puzl"
  
  name       = local.integration_name
  namespace  = local.integration_namespace
  gitlab_url = local.gitlab_url
  service_account_permissions = {
    read_pipeline_namespace_secrets = true
    manage_claim_namespace_secrets  = false
  }
}
```
