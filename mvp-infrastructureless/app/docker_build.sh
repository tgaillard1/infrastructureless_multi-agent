#!/bin/bash
# docker_build.sh

# Capture arguments sent from the Master Script [cite: 220]
REPO_URL=$1
PROJECT_ID=$2

echo "Starting Docker Build for Project: $PROJECT_ID"
echo "Pushing to: $REPO_URL"

# 1. Authenticate Docker with GCP
gcloud auth configure-docker "${REPO_URL%%/*}" --quiet

# 2. Build the image using the dynamic Repo URL [cite: 226]
docker build -t "$REPO_URL/my-app:latest" .

# 3. Push to the infrastructure Terraform just created [cite: 227]
docker push "$REPO_URL/my-app:latest"

echo "Docker Image successfully pushed to infrastructure."
