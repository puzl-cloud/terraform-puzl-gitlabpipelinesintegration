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