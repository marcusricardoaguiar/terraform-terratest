provider "google" {
  credentials = file("./terraform-opa-4e64c656583b.json")
  project     = "your-project-id"
  region      = "us-central1"
}

resource "google_compute_instance" "vm" {
  name         = "vm-name"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    
  }
}
