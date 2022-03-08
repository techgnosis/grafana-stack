resource "google_compute_instance" "jmusselwhite-k3s" {
  name         = "jmusselwhite-k3s"
  machine_type = "e2-medium"

  tags = ["jmusselwhite"]

  boot_disk {
    initialize_params {
      size = 100
      image = "ubuntu-2004-focal-v20220303a"
    }
  }

  network_interface {
    network = "default"

    access_config {
      network_tier = "STANDARD"
    }
  }
}