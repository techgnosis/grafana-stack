output "instance_ip_addr" {
  value       = google_compute_instance.musselwhite-temp.network_interface.0.access_config.0.nat_ip
  description = "The public IP address of the test VM"
}