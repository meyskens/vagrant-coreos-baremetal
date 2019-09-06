variable "cluster_domain_suffix" {
  description = "Queries for domains with the suffix will be answered by kube-dns"
  type        = "string"
  default     = "cluster.local"
}

variable "cluster_name" {
  description = "Unique cluster name"
  type        = "string"
}

variable "k8s_domain_name" {
  description = "Controller DNS name which resolves to a controller instance. Workers and kubeconfig's will communicate with this endpoint (e.g. cluster.example.com)"
  type        = "string"
}

variable "ca_certificate" {
  description = "Existing PEM-encoded CA certificate (generated if blank)"
  type        = "string"
}

variable "ca_key_alg" {
  description = "Algorithm used to generate ca_key (required if ca_cert is specified)"
  type        = "string"
  default     = "RSA"
}

variable "ca_private_key" {
  description = "Existing Certificate Authority private key (required if ca_certificate is set)"
  type        = "string"
}

variable "matchbox_http_endpoint" {
  description = "Matchbox HTTP endpoint"
  type        = "string"
}

variable "matchbox_rpc_endpoint" {
  description = "Matchbox gRPC endpoint"
  type        = "string"
}

variable "container_linux_version" {
  description = "Container Linux version"
  default     = "1967.6.0"
}

# This is a hack. We need a first run for bootkube module to create assets
# in which this variable will be set to false as assets that will be copied
# as ignition files to the server haven't already been created
variable "create_bootkube_assets_ignition_files" {
  default = false
}

variable "k8s_ip" {
  description = "IP that will be use to access k8s API"
}

variable "external_apiserver_port" {
  description = "Port that will balance between k8s api servers"
  default     = "443"
}

variable "internal_apiserver_port" {
  description = "Port will be used internally by k8s api servers"
  default     = "6443"
}

# These two variables are the result of not being able to use filesystem
# reuse semantics in ignition 2.1. These are not related to root filesystem
# but with the data partition. Set them to true the first time you install
# a server if you want partitions/filesystems to be created from scratch
variable "wipe_worker_filesystems" {
  default = false
}

variable "wipe_controller_filesystems" {
  default = false
}

variable "dnsmasq_servers" {
  description = "Servers with dnsmasq running. We will connect to them so they download new configuration"
  type        = "list"
}

# We don't have list of maps in terraform
# These list MUST be ordered so they match 
variable "controller_internal_ips" {
  type = "list"
}

variable "controller_internal_interfaces" {
  type = "list"
}

variable "controller_domains" {
  type = "list"
}

variable "kubelet_image_tag" {
  description = "Version of the kubelet"
  default     = "v1.11.8"
}
