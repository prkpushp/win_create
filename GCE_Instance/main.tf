terraform {
  backend "gcs" {}
}

locals {
  zone_map               = zipmap((flatten(module.google_vm[*].google_instance_id)), (flatten(module.google_vm[*].google_instance_zone)))
  #rev_zone_map           = { for key, value in local.zone_map : value => key... }
}

data "google_compute_zones" "available" {
  project = var.project
  region  = var.region
}

data "google_compute_image" "custom_image" {
  project = var.image_project
  name    = var.image_name
}

resource "random_integer" "integer" {
  min   = "0000000000"
  max   = "9999999999"
  count = var.num_instances
}

module "google_vm" {
  source = "git::https://github.com/UKGEPIC/terraform-google-core.git//modules/compute_engine_instance?ref=v1.4.0"
  depends_on = [
    random_integer.integer,
    data.google_compute_zones.available
  ]

  project                 = var.project
  count                   = var.num_instances
  #zone                    = var.zone == null ? data.google_compute_zones.available.names[count.index % length(data.google_compute_zones.available.names)] : var.zone
  zone                    = var.region
  name                    = "${var.instance_name}-${random_integer.integer[count.index].result}"
  network                 = var.network
  subnetwork              = var.subnetwork
  subnetwork_project      = var.subnetwork_project
  image                   = data.google_compute_image.custom_image.self_link
  tags                    = var.tags
  machine_type            = var.machine_type
  boot_disk_type          = var.boot_disk_type
  boot_disk_size          = var.boot_disk_size
  device_name             = "${var.instance_name}-${random_integer.integer[count.index].result}"
  metadata                = var.metadata
  metadata_startup_script = var.metadata_startup_script
  additional_networks     = var.additional_networks
  stack_id                = var.stack_id
  env_id                  = var.env_id
  instance_name           = "${var.instance_name}-${random_integer.integer[count.index].result}"
  service_name            = var.service_name
  service_function        = var.service_function
  cluster_id              = var.cluster_id
  state                   = var.state
  service_account = {
    email  = "svc-kcfn01-cmp-user@gcp-kcfn01.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
}
}


