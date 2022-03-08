resource "google_compute_firewall" "jmusselwhite-k3s" {
  name        = "jmusselwhite-k3s"
  network     = "default"
  description = "Rules for jmusselwhite-k3s VM"

  allow {
    protocol  = "tcp"
    ports     = ["6443", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["jmusselwhite"]
}