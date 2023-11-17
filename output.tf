output "claim_namespace_ref" {
  value = try(kubernetes_manifest.gitlabpipelinesintegration.object.spec.claimNamespaceRef, null)
  description = "Reference to the namespace where the GitLabRunnerClaim resources will be created."
}

output "serviceaccount_ref" {
    value = {
    name      = try(kubernetes_manifest.gitlabpipelinesintegration.object.spec.serviceAccountRef.name, null)
    namespace = try(kubernetes_manifest.gitlabpipelinesintegration.object.spec.serviceAccountRef.namespace, null)
  }
  description = "Reference to a ServiceAccount that has been granted with the limited permissions for managing the claim namespace only."
}
