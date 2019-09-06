variable "server_count" {
  description = "Number of servers"
  default     = 0
}

variable "internal_interfaces" {
  description = "Internal server interfaces"
  type        = "list"
}

variable "external_interfaces" {
  description = "external server interfaces"
  type        = "list"
  default     = []
}

variable "enable_external_interfaces" {
  description = " enable external server interfaces"
  default     = true
}

variable "internal_mtu_bytes" {
  description = "Internal Maximum Transfer Unit bytes"
  default     = "9000"
}

variable "vlan_id" {
  description = "VLAN id for online RPNv2 servers"
  default     = ""
}

#variable "controller_internal_mac" {}

