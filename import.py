import vertexai

PROJECT_ID = "tg-gcp-env"
LOCATION = "us-central1"
STAGING_BUCKET = "gs://agent-transfer-bucket"

vertexai.init(
    project=PROJECT_ID,
    location=LOCATION,
    staging_bucket=STAGING_BUCKET,
)
