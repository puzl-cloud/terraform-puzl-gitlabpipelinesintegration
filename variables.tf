variable "name" {
  description = "The name for the GitLabPipelinesIntegration resource."
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace where the GitLabPipelinesIntegration will be created."
  type        = string
}

variable "gitlab_url" {
  description = "Designates the URL of your GitLab instance."
  type        = string
}

variable "service_account_permissions" {
  description = "Contains capabilities of the Integration Service Account, which may be utilized for managing GitLab runners."
  type = object({
    read_pipeline_namespace_secrets  = bool
    manage_claim_namespace_secrets   = bool
  })
  default = {
    read_pipeline_namespace_secrets  = false
    manage_claim_namespace_secrets   = false
  }
}

variable "resources" {
  description = "Defines the settings for managing resources of pipeline jobs."
  type = object({
    persistentStorage = optional(object({
      cacheRetentionTime = optional(number)
    }))
  })
}
