resource "google_service_account" "musselwhite-temp" {
  account_id   = "musselwhite-temp"
  display_name = "musselwhite-temp-vm"
}

resource "google_compute_instance" "musselwhite-temp" {
  name         = "musselwhite-test"
  machine_type = "e2-medium"

  tags = ["musselwhite"]

  boot_disk {
    initialize_params {
      image = "rhel-8-v20211105"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.musselwhite-temp.email
    scopes = ["cloud-platform"]
  }
}