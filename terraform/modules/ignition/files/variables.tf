variable "kubelet_image_tag" {
  default = "v1.11.0"
}

variable "haproxy_apiserver_port" {
  description = "Port that will balance between k8s api servers"
  default     = "443"
}

variable "k8s_apiserver_port" {
  description = "Port will be used internally by k8s api servers"
  default     = "6443"
}

variable "haproxy_stats_port" {
  description = "Haproxy stats port"
  default     = "9000"
}

variable "haproxy_stats_user" {
  description = "Haproxy stats web user"
  default     = "srcd"
}

variable "haproxy_stats_password" {
  description = "Haproxy stats web password"
  default     = "srcd123"
}

variable "keepalived_virtual_router_id" {
  description = "used to differentiate multiple instances of vrrpd"
  default     = "51"
}

variable "keepalived_virtual_ipaddress" {
  description = "Keepalived floating address"
  default     = "10.1.1.2"
}

variable "keepalived_interface" {
  description = "Keepalived interface"
  default     = "internal0.k8s"
}

variable "controller_domains" {
  type    = "list"
  default = []
}

variable "domains" {
  type = "list"
}

variable "kubectl_version" {
  default = "v1.11.3"
}

variable "kubectl_sha512" {
  default = "f222eb06729ea174af643c9cc3f0c6c0d436debc8f1fbf1fd935b401cb029d82d6169264d57e22f2f1077324676bfe2f47ca5bb899094699fd443c0f25dba1f4"
}
