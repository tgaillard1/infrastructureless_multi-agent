import google.auth
import google.auth.transport.requests
import requests

# Setup auth
creds, project = google.auth.default()
auth_req = google.auth.transport.requests.Request()
creds.refresh(auth_req)

# API Request
url = f"https://us-central1-aiplatform.googleapis.com/v1beta1/projects/{project}/locations/us-central1/extensions"
headers = {"Authorization": f"Bearer {creds.token}"}
response = requests.get(url, headers=headers)

# Print results
if response.status_code == 200:
    for ext in response.json().get('extensions', []):
        print(f"Name: {ext.get('displayName')}")
        print(f"ID:   {ext.get('name')}\n")
else:
    print("Error:", response.text)
