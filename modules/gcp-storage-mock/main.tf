provider "google" {
  credentials = file("./terraform-opa-4e64c656583b.json")
  project     = var.project_id
  region      = "us-central1"
}

resource "google_storage_bucket" "example" {
  name     = "example-bucket-1234"
  location = "US"
}
