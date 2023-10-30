project           = "gcp-kcfn01"
image_project     = "gcp-kcfn01"
subnetwork_project = "gcp-kcfn01"
dns_project_name   = "gcp-kcfn01"
dns_zone_name      = "private-kcfn" 
domain_name        = "int.kcfn.mykronos.com"
region             = "us-east1-b"
num_instances     = "1"
num_zone          = "1"
image_name        = "kcloud-cloudops-kcfn01-bli-creation"
instance_name     = "tmpcfn"
tags              = ["kcfn01-local", "oss01-dns-app"]
network           = "cfn02-sss-net"
subnetwork        = "cfn02-use1-sss-oss-snet01"
machine_type      = "n1-standard-8"
boot_disk_size    = "200"
boot_disk_type    = "pd-standard"
health_check_name = "oss01-bli-app-hck"
health_check = {
  check_interval_sec  = "5"
  healthy_threshold   = "2"
  timeout_sec         = "5"
  unhealthy_threshold = "2"
  response            = ""
  proxy_header        = "NONE"
  port                = "8000"
  port_name           = ""
  request             = ""
  enable_log          = false
}
backend_service_name = "use1-oss01-bli-app-ilb-bks-01"
forwarding_rule_name = "use1-oss01-bli-app-ilb-01"
ports                = ["8000"]
########Labels
stack_id         = "shd-cus01"
env_id           = "oss01"
service_name     = "bli"
service_function = "app"
cluster_id       = "10"
state            = "live"
