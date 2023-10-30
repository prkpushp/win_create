<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.1.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >=4.20.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >=4.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >=4.20.0 |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_google_interal_lb"></a> [google\_interal\_lb](#module\_google\_interal\_lb) | git::https://github.com/ukg-cloud/terraform-google-core.git//modules/network_services_lb_internal | v1.4.0 |
| <a name="module_google_lb_cname"></a> [google\_lb\_cname](#module\_google\_lb\_cname) | git::https://github.com/ukg-cloud/terraform-google-core.git//modules/network_services_cloud_dns | v1.4.0 |
| <a name="module_google_lb_set_dns"></a> [google\_lb\_set\_dns](#module\_google\_lb\_set\_dns) | git::https://github.com/ukg-cloud/terraform-google-core.git//modules/network_services_cloud_dns | v1.4.0 |
| <a name="module_google_uig"></a> [google\_uig](#module\_google\_uig) | git::https://github.com/ukg-cloud/terraform-google-core.git//modules/compute_engine_uig | v1.4.0 |
| <a name="module_google_vm"></a> [google\_vm](#module\_google\_vm) | git::https://github.com/ukg-cloud/terraform-google-core.git//modules/compute_engine_instance | v1.4.0 |
| <a name="module_google_vm_set_dns"></a> [google\_vm\_set\_dns](#module\_google\_vm\_set\_dns) | git::https://github.com/ukg-cloud/terraform-google-core.git//modules/network_services_cloud_dns | v1.4.0 |

## Resources

| Name | Type |
|------|------|
| [local_file.AnsibleInventory](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.ansible_group_vars](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [random_integer.integer](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) | resource |
| [google_compute_image.custom_image](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_image) | data source |
| [google_compute_zones.available](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_networks"></a> [additional\_networks](#input\_additional\_networks) | Additional network interface details for GCE, if any. | <pre>list(object({<br>    network            = string<br>    subnetwork         = string<br>    subnetwork_project = string<br>  }))</pre> | `[]` | no |
| <a name="input_backend_service_name"></a> [backend\_service\_name](#input\_backend\_service\_name) | Name of the backend service | `string` | n/a | yes |
| <a name="input_boot_disk_size"></a> [boot\_disk\_size](#input\_boot\_disk\_size) | Boot disk size in GB | `string` | n/a | yes |
| <a name="input_boot_disk_type"></a> [boot\_disk\_type](#input\_boot\_disk\_type) | Boot disk type | `string` | n/a | yes |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | Cluster ID | `number` | n/a | yes |
| <a name="input_connection_draining_timeout_sec"></a> [connection\_draining\_timeout\_sec](#input\_connection\_draining\_timeout\_sec) | Time for which instance will be drained | `number` | `null` | no |
| <a name="input_dns_project_name"></a> [dns\_project\_name](#input\_dns\_project\_name) | Project where the GCP resource should provision | `string` | n/a | yes |
| <a name="input_dns_zone_name"></a> [dns\_zone\_name](#input\_dns\_zone\_name) | Zone name, must be unique within the project. | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Zone domain, must end with a period. | `string` | n/a | yes |
| <a name="input_env_id"></a> [env\_id](#input\_env\_id) | Environment ID | `string` | n/a | yes |
| <a name="input_forwarding_rule_name"></a> [forwarding\_rule\_name](#input\_forwarding\_rule\_name) | Name of the backend service | `string` | n/a | yes |
| <a name="input_health_check"></a> [health\_check](#input\_health\_check) | Health check to determine whether instances are responsive and able to do work | <pre>object({<br>    check_interval_sec  = number<br>    healthy_threshold   = number<br>    timeout_sec         = number<br>    unhealthy_threshold = number<br>    response            = string<br>    proxy_header        = string<br>    port                = number<br>    port_name           = string<br>    request             = string<br>    enable_log          = bool<br>  })</pre> | n/a | yes |
| <a name="input_health_check_name"></a> [health\_check\_name](#input\_health\_check\_name) | Name of the health check | `string` | n/a | yes |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | Name of GCP Image | `string` | n/a | yes |
| <a name="input_image_project"></a> [image\_project](#input\_image\_project) | Project of GCP Image | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | The name of the instance. If not provided, the `name` will be used. | `string` | `""` | no |
| <a name="input_ip_protocol"></a> [ip\_protocol](#input\_ip\_protocol) | The IP protocol for the backend and frontend forwarding rule. TCP or UDP. | `string` | `"TCP"` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | GCP Machine type | `string` | n/a | yes |
| <a name="input_metadata"></a> [metadata](#input\_metadata) | Metdatda of the instance in key:value pair | `map(string)` | `{}` | no |
| <a name="input_metadata_startup_script"></a> [metadata\_startup\_script](#input\_metadata\_startup\_script) | startup script of the instance for bootstrapping | `string` | `""` | no |
| <a name="input_network"></a> [network](#input\_network) | Network to deploy to | `string` | n/a | yes |
| <a name="input_num_instances"></a> [num\_instances](#input\_num\_instances) | Number of GCP instance to create. | `number` | `"1"` | no |
| <a name="input_num_zone"></a> [num\_zone](#input\_num\_zone) | Number of zones in the region where resource is created. | `number` | `"1"` | no |
| <a name="input_port_mapping"></a> [port\_mapping](#input\_port\_mapping) | Named name and named port | <pre>list(object({<br>    port_name   = string<br>    port_number = number<br>  }))</pre> | `[]` | no |
| <a name="input_ports"></a> [ports](#input\_ports) | List of ports range to forward to backend services. Max is 5. | `list(string)` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project where the GCP resource should provision | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region where the GCP resource should provision | `string` | n/a | yes |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | name of account to interact with gcp resources | <pre>object({<br>    email  = string<br>    scopes = set(string)<br>  })</pre> | <pre>{<br>  "email": null,<br>  "scopes": []<br>}</pre> | no |
| <a name="input_service_function"></a> [service\_function](#input\_service\_function) | Service Function | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Service Name | `string` | n/a | yes |
| <a name="input_session_affinity"></a> [session\_affinity](#input\_session\_affinity) | The session affinity for the backends example: NONE, CLIENT\_IP. Default is `NONE`. | `string` | `"NONE"` | no |
| <a name="input_stack_id"></a> [stack\_id](#input\_stack\_id) | stack ID | `string` | n/a | yes |
| <a name="input_state"></a> [state](#input\_state) | State | `string` | n/a | yes |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | Subnetwork to deploy to | `string` | n/a | yes |
| <a name="input_subnetwork_project"></a> [subnetwork\_project](#input\_subnetwork\_project) | subnetwork project to deploy to | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | GCP network tags | `list(any)` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | Zone where the GCP resource should provision | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_forwarding_rule_id"></a> [forwarding\_rule\_id](#output\_forwarding\_rule\_id) | The forwarding rule id. |
| <a name="output_forwarding_rule_ip_address"></a> [forwarding\_rule\_ip\_address](#output\_forwarding\_rule\_ip\_address) | The internal IP assigned to the regional forwarding rule. |
| <a name="output_forwarding_rule_self_link"></a> [forwarding\_rule\_self\_link](#output\_forwarding\_rule\_self\_link) | The forwarding rule self\_link. |
| <a name="output_google_instance_ip"></a> [google\_instance\_ip](#output\_google\_instance\_ip) | List of compute instance network IP |
| <a name="output_google_instance_name"></a> [google\_instance\_name](#output\_google\_instance\_name) | List of compute instance name |
| <a name="output_google_uig_name"></a> [google\_uig\_name](#output\_google\_uig\_name) | List of name for unmanaged instance groups |
| <a name="output_google_uig_self_link"></a> [google\_uig\_self\_link](#output\_google\_uig\_self\_link) | List of self-links for unmanaged instance groups |
| <a name="output_google_uig_zone"></a> [google\_uig\_zone](#output\_google\_uig\_zone) | List of zone for unmanaged instance groups |
| <a name="output_zone_map"></a> [zone\_map](#output\_zone\_map) | A map of zone and id of the compute instance |
<!-- END_TF_DOCS -->