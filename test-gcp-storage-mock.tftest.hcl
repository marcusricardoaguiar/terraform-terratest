variables {
  project_id = "your-project-id"
}

run "valid_bucket_name" {
  command = plan
  assert {
    condition     = google_storage_bucket.example.name == "example-bucket-1234"
    error_message = "S3 bucket name did not match expected"
  }
  module {
    source = "./modules/gcp-storage-mock"
  }
}

run "valid_bucket_force_destroy" {
  command = plan
  assert {
    condition     = google_storage_bucket.example.force_destroy == false
    error_message = "S3 bucket project id did not match expected"
  }
  module {
    source = "./modules/gcp-storage-mock"
  }
}
