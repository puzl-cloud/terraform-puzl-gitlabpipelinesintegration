resource "kubernetes_manifest" "gitlabpipelinesintegration" {
  manifest = {
    apiVersion = "gitlab-pipelines.svcs.puzl.cloud/v1"
    kind       = "GitLabPipelinesIntegration"
    metadata = {
      name      = var.name
      namespace = var.namespace
    }
    spec = {
      gitlabUrl = var.gitlab_url
      serviceAccountPermissions = {
        readPipelineNamespaceSecrets = var.service_account_permissions.read_pipeline_namespace_secrets
        manageClaimNamespaceSecrets = var.service_account_permissions.manage_claim_namespace_secrets
      }
    }
  }

  wait {
    fields = {
      "status.phase" = "Ready"
    }
  }

  timeouts {
    create = "2m"
    update = "2m"
    delete = "2m"
  }
}
