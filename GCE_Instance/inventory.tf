resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
    {
      private_ip = [for key, ip in flatten(module.google_vm[*].google_instance_ip) : ip],
    }
  )
  filename = "hosts"
}