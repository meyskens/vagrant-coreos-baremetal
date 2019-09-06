variable "etcd_image_tag" {
  description = "Etcd container image tag"
  default     = "v3.3.8"
}

variable "etcd_name" {
  description = "Etcd node name"
  default     = "local1"
}

variable "etcd_fqdn" {
  description = "Etcd fully qualified domain name"
  default     = "localhost.localdomain"
}

variable "etcd_initial_cluster" {
  description = "ETCD_INITIAL_CLUSTER env variable value"
  default     = "local1:http://localhost.localdomain:2380"
}

variable "etcd_listen_client_urls" {
  description = "ETCD_LISTEN_CLIENT_URLS env variable"
  default     = "https://0.0.0.0:2379"
}

variable "etcd_listen_peers_urls" {
  description = "ETCD_LISTEN_PEER_URLS env variable"
  default     = "https://0.0.0.0:2380"
}

variable "etcd_listen_metrics_urls" {
  description = "ETCD_LISTEN_METRICS_URLS env variable"
  default     = "http://0.0.0.0:2381"
}

variable "etcd_data_dir" {
  description = "ETCD_DATA_DIR variable"
  default     = "/data/etcd"
}

variable "filesystem_type" {
  description = "Filesystem type"
  default     = "xfs"
}

variable "controller_domains" {
  type    = "list"
  default = []
}

variable "worker_domains" {
  type    = "list"
  default = []
}

variable "elasticsearch_worker_domains" {
  type    = "list"
  default = []
}

variable "jenkins_worker_domains" {
  type    = "list"
  default = []
}

variable "rabbitmq_worker_domains" {
  type    = "list"
  default = []
}

variable "postgres_worker_domains" {
  type    = "list"
  default = []
}

variable "prometheus_worker_domains" {
  type    = "list"
  default = []
}

variable "cluster_domain_suffix" {
  default = "cluster.local"
}

variable "k8s_dns_service_ip" {
  default = "10.0.0.10"
}

variable "haproxy_syslogd_version" {
  description = "Haproxy container version srcd/haproxy-syslogd"
  default     = "1.8.2-alpine"
}

variable "haproxy_apiserver_port" {
  description = "Haproxy port that will balance between k8s api servers"
  default     = "443"
}

variable "haproxy_stats_port" {
  description = "Haproxy stats port"
  default     = "9000"
}

variable "keepalived_version" {
  description = "Keepalived container version from osixia/keepalived"
  default     = "1.3.9"
}

variable "gluster_version" {
  description = "gluster container version from gluster/gluster-centos"
  default     = "gluster4u0_centos7"
}
