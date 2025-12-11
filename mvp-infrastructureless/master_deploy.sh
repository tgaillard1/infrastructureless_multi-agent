#!/bin/bash
set -e

echo "### STEP 1: PROVISIONING INFRASTRUCTURE WITH TERRAFORM ###"
cd infrastructure

# Initialize and Apply Terraform
terraform init
terraform apply -auto-approve

# THE HANDSHAKE [cite: 179]
# Capture Terraform outputs into variables
REPO_URL=$(terraform output -raw repository_url)
PROJECT_ID=$(terraform output -raw project_id)

echo "Infrastructure Ready."
echo "Target Repository: $REPO_URL"

# Navigate back to root
cd ..

echo "### STEP 2: EXECUTING DOCKER DEPLOYMENT SCRIPT ###"
# Pass Terraform variables into Docker script as arguments [cite: 189]
cd app
chmod +x docker_build.sh
./docker_build.sh "$REPO_URL" "$PROJECT_ID"

echo "### DEPLOYMENT COMPLETE ###"
