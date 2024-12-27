variables {
  project_id = "your-project-id"
}

run "valid_instance_name" {
  command = plan
  assert {
    condition     = google_compute_instance.vm.name == "vm-name"
    error_message = "Instance name did not match expected"
  }
  module {
    source = "./modules/gcp-instance-mock"
  }
}

run "valid_image_type" {
  command = plan
  assert {
    condition     = google_compute_instance.vm.boot_disk[0].initialize_params[0].image == "debian-cloud/debian-9"
    error_message = "Instance image name did not match expected"
  }
  module {
    source = "./modules/gcp-instance-mock"
  }
}
