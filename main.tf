resource "kubernetes_manifest" "gitlabpipelinesintegration" {
  manifest = {
    apiVersion = "gitlab-pipelines.svcs.puzl.cloud/v2"
    kind       = "GitLabPipelinesIntegration"
    metadata = {
      name      = var.name
      namespace = var.namespace
    }
    spec = {
      gitlabUrl = var.gitlab_url
      serviceAccountPermissions = {
        readJobNamespaceSecrets = var.service_account_permissions.read_job_namespace_secrets
        manageClaimNamespaceSecrets = var.service_account_permissions.manage_claim_namespace_secrets
      }
      resources = {
        persistentStorage = {
          cacheRetentionTime = try(var.resources.persistentStorage.cacheRetentionTime, 30)
        }
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
