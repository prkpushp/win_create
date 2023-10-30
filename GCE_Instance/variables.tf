variable "project" {
  type        = string
  description = "Project where the GCP resource should provision"
}

variable "region" {
  type        = string
  description = "Region where the GCP resource should provision"
}

variable "num_instances" {
  default     = "1"
  type        = number
  description = "Number of GCP instance to create."
}

variable "num_zone" {
  default     = "1"
  type        = number
  description = "Number of zones in the region where resource is created."
}

variable "zone" {
  type        = string
  default     = null
  description = "Zone where the GCP resource should provision"
}

variable "image_project" {
  type        = string
  description = "Project of GCP Image"
}

variable "image_name" {
  type        = string
  description = "Name of GCP Image"
}

variable "instance_name" {
  description = "The name of the instance. If not provided, the `name` will be used."
  type        = string
  default     = ""
}

variable "metadata" {
  type        = map(string)
  default     = {}
  description = "Metdatda of the instance in key:value pair"
}

variable "metadata_startup_script" {
  default     = ""
  description = "startup script of the instance for bootstrapping"
}

variable "service_account" {
  description = "name of account to interact with gcp resources"
  type = object({
    email  = string
    scopes = set(string)
  })
  default = {
    email  = null
    scopes = []
  }
}

variable "tags" {
  type        = list(any)
  description = "GCP network tags"
}

variable "machine_type" {
  type        = string
  description = "GCP Machine type"
}

variable "boot_disk_size" {
  type        = string
  description = "Boot disk size in GB"
}

variable "boot_disk_type" {
  type        = string
  description = "Boot disk type"
}

variable "network" {
  type        = string
  description = "Network to deploy to"
}

variable "subnetwork" {
  type        = string
  description = "Subnetwork to deploy to"
}

variable "subnetwork_project" {
  type        = string
  description = "subnetwork project to deploy to"
}

variable "port_mapping" {
  description = "Named name and named port"
  type = list(object({
    port_name   = string
    port_number = number
  }))
  default = []
}

variable "additional_networks" {
  description = "Additional network interface details for GCE, if any."
  default     = []
  type = list(object({
    network            = string
    subnetwork         = string
    subnetwork_project = string
  }))
}

variable "health_check_name" {
  type        = string
  description = "Name of the health check"
}

variable "health_check" {
  description = "Health check to determine whether instances are responsive and able to do work"
  type = object({
    check_interval_sec  = number
    healthy_threshold   = number
    timeout_sec         = number
    unhealthy_threshold = number
    response            = string
    proxy_header        = string
    port                = number
    port_name           = string
    request             = string
    enable_log          = bool
  })
}
variable "backend_service_name" {
  type        = string
  description = "Name of the backend service"
}
variable "ip_protocol" {
  description = "The IP protocol for the backend and frontend forwarding rule. TCP or UDP."
  default     = "TCP"
}

variable "connection_draining_timeout_sec" {
  description = "Time for which instance will be drained"
  default     = null
  type        = number
}
variable "session_affinity" {
  description = "The session affinity for the backends example: NONE, CLIENT_IP. Default is `NONE`."
  default     = "NONE"
}

variable "forwarding_rule_name" {
  type        = string
  description = "Name of the backend service"
}

variable "ports" {
  description = "List of ports range to forward to backend services. Max is 5."
  type        = list(string)
}

variable "stack_id" {
  type        = string
  description = "stack ID"
}

variable "env_id" {
  type        = string
  description = "Environment ID"
}

variable "service_name" {
  type        = string
  description = "Service Name"
}

variable "service_function" {
  type        = string
  description = "Service Function"
}

variable "cluster_id" {
  type        = number
  description = "Cluster ID"
}

variable "state" {
  type        = string
  description = "State"

}

variable "dns_project_name" {
  type        = string
  description = "Project where the GCP resource should provision"
}

variable "dns_zone_name" {
  description = "Zone name, must be unique within the project."
  type        = string
}

variable "domain_name" {
  description = "Zone domain, must end with a period."
  type        = string
}