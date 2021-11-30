resource "google_compute_firewall" "musselwhite-vm" {
  name        = "musselwhite"
  network     = "default"
  description = "Rules for James Musselwhite"

  allow {
    protocol  = "tcp"
    ports     = ["3000", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["musselwhite"]
}