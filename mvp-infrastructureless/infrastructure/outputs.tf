output "repository_url" {
  value       = "${google_artifact_registry_repository.my_repo.location}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.my_repo.repository_id}"
  description = "The URL of the docker repository created by Terraform"
}

output "project_id" {
  value = var.project_id
}
