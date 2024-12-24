provider "google" {
  credentials = file("path/to/your/credentials.json")
  project     = "your-project-id"
  region      = "us-central1"
}

resource "google_storage_bucket" "example" {
  name     = "example-bucket-1234"
  location = "US"
}
