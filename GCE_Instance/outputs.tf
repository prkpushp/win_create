output "google_instance_name" {
  description = "List of compute instance name"
  value       = flatten(module.google_vm[*].google_instance_name)
}

output "google_instance_ip" {
  description = "List of compute instance network IP"
  value       = flatten(module.google_vm[*].google_instance_ip)
}


output "zone_map" {
  value       = zipmap((flatten(module.google_vm[*].google_instance_id)), (flatten(module.google_vm[*].google_instance_zone)))
  description = "A map of zone and id of the compute instance"
}
