provider "google" {
  project = "YOUR_PROJECT_ID" # Replace with your actual Project ID
  region  = "us-central1"
}

resource "google_artifact_registry_repository" "my_repo" {
  location      = "us-central1"
  repository_id = "infrastructureless-repo"
  description   = "MVP Repo created by Terraform"
  format        = "DOCKER"
}

# Variable for passing project ID if needed dynamically
variable "project_id" {
  default = "YOUR_PROJECT_ID"
}
