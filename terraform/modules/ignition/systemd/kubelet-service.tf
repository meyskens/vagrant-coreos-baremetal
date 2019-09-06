data "template_file" "kubelet_controller_service" {
  count    = "${length(var.controller_domains)}"
  template = "${file("${path.module}/files/kubelet-controller.service.tpl")}"

  vars {
    domain_name           = "${element(var.controller_domains, count.index)}"
    k8s_dns_service_ip    = "${var.k8s_dns_service_ip}"
    cluster_domain_suffix = "${var.cluster_domain_suffix}"
  }
}

data "ignition_systemd_unit" "kubelet_controller_service" {
  count   = "${length(var.controller_domains)}"
  name    = "kubelet.service"
  content = "${element(data.template_file.kubelet_controller_service.*.rendered, count.index)}"
}

output "kubelet_controller_service" {
  value = "${data.ignition_systemd_unit.kubelet_controller_service.*.id}"
}

data "template_file" "kubelet_worker_service" {
  count    = "${length(var.worker_domains)}"
  template = "${file("${path.module}/files/kubelet-worker.service.tpl")}"

  vars {
    domain_name           = "${element(var.worker_domains, count.index)}"
    k8s_dns_service_ip    = "${var.k8s_dns_service_ip}"
    cluster_domain_suffix = "${var.cluster_domain_suffix}"
    node_labels           = "srcd.host/type=worker"
    extra_mounts          = "--volume data-a,kind=host,source=/data-a --mount volume=data-a,target=/data-a --volume data-b,kind=host,source=/data-b --mount volume=data-b,target=/data-b --volume data-c,kind=host,source=/data-c --mount volume=data-c,target=/data-c"
  }
}

data "ignition_systemd_unit" "kubelet_worker_service" {
  count   = "${length(var.worker_domains)}"
  name    = "kubelet.service"
  content = "${element(data.template_file.kubelet_worker_service.*.rendered, count.index)}"
}

output "kubelet_worker_service" {
  value = "${data.ignition_systemd_unit.kubelet_worker_service.*.id}"
}

data "template_file" "kubelet_elasticsearch_worker_service" {
  count    = "${length(var.elasticsearch_worker_domains)}"
  template = "${file("${path.module}/files/kubelet-worker.service.tpl")}"

  vars {
    domain_name           = "${element(var.elasticsearch_worker_domains, count.index)}"
    k8s_dns_service_ip    = "${var.k8s_dns_service_ip}"
    cluster_domain_suffix = "${var.cluster_domain_suffix}"
    node_labels           = "srcd.host/type=elasticsearch"
    extra_mounts          = "--volume data,kind=host,source=/data --mount volume=data,target=/data"
  }
}

data "ignition_systemd_unit" "kubelet_elasticsearch_worker_service" {
  count   = "${length(var.elasticsearch_worker_domains)}"
  name    = "kubelet.service"
  content = "${element(data.template_file.kubelet_elasticsearch_worker_service.*.rendered, count.index)}"
}

output "kubelet_elasticsearch_worker_service" {
  value = "${data.ignition_systemd_unit.kubelet_elasticsearch_worker_service.*.id}"
}

data "template_file" "kubelet_jenkins_worker_service" {
  count    = "${length(var.jenkins_worker_domains)}"
  template = "${file("${path.module}/files/kubelet-worker.service.tpl")}"

  vars {
    domain_name           = "${element(var.jenkins_worker_domains, count.index)}"
    k8s_dns_service_ip    = "${var.k8s_dns_service_ip}"
    cluster_domain_suffix = "${var.cluster_domain_suffix}"
    node_labels           = "srcd.host/type=jenkins-worker"
    extra_mounts          = "--volume data-a,kind=host,source=/data-a --mount volume=data-a,target=/data-a --volume data-b,kind=host,source=/data-b --mount volume=data-b,target=/data-b --volume data-c,kind=host,source=/data-c --mount volume=data-c,target=/data-c"
  }
}

data "ignition_systemd_unit" "kubelet_jenkins_worker_service" {
  count   = "${length(var.jenkins_worker_domains)}"
  name    = "kubelet.service"
  content = "${element(data.template_file.kubelet_jenkins_worker_service.*.rendered, count.index)}"
}

output "kubelet_jenkins_worker_service" {
  value = "${data.ignition_systemd_unit.kubelet_jenkins_worker_service.*.id}"
}

data "template_file" "kubelet_rabbitmq_worker_service" {
  count    = "${length(var.rabbitmq_worker_domains)}"
  template = "${file("${path.module}/files/kubelet-worker.service.tpl")}"

  vars {
    domain_name           = "${element(var.rabbitmq_worker_domains, count.index)}"
    k8s_dns_service_ip    = "${var.k8s_dns_service_ip}"
    cluster_domain_suffix = "${var.cluster_domain_suffix}"
    node_labels           = "srcd.host/type=rabbitmq"
    extra_mounts          = "--volume data,kind=host,source=/data --mount volume=data,target=/data"
  }
}

data "ignition_systemd_unit" "kubelet_rabbitmq_worker_service" {
  count   = "${length(var.rabbitmq_worker_domains)}"
  name    = "kubelet.service"
  content = "${element(data.template_file.kubelet_rabbitmq_worker_service.*.rendered, count.index)}"
}

output "kubelet_rabbitmq_worker_service" {
  value = "${data.ignition_systemd_unit.kubelet_rabbitmq_worker_service.*.id}"
}

data "template_file" "kubelet_postgres_worker_service" {
  count    = "${length(var.postgres_worker_domains)}"
  template = "${file("${path.module}/files/kubelet-worker.service.tpl")}"

  vars {
    domain_name           = "${element(var.postgres_worker_domains, count.index)}"
    k8s_dns_service_ip    = "${var.k8s_dns_service_ip}"
    cluster_domain_suffix = "${var.cluster_domain_suffix}"
    node_labels           = "srcd.host/type=postgres"
    extra_mounts          = "--volume data,kind=host,source=/data --mount volume=data,target=/data"
  }
}

data "ignition_systemd_unit" "kubelet_postgres_worker_service" {
  count   = "${length(var.postgres_worker_domains)}"
  name    = "kubelet.service"
  content = "${element(data.template_file.kubelet_postgres_worker_service.*.rendered, count.index)}"
}

output "kubelet_postgres_worker_service" {
  value = "${data.ignition_systemd_unit.kubelet_postgres_worker_service.*.id}"
}

data "template_file" "kubelet_prometheus_worker_service" {
  count    = "${length(var.prometheus_worker_domains)}"
  template = "${file("${path.module}/files/kubelet-worker.service.tpl")}"

  vars {
    domain_name           = "${element(var.prometheus_worker_domains, count.index)}"
    k8s_dns_service_ip    = "${var.k8s_dns_service_ip}"
    cluster_domain_suffix = "${var.cluster_domain_suffix}"
    node_labels           = "srcd.host/type=prometheus"
    extra_mounts          = "--volume data,kind=host,source=/data --mount volume=data,target=/data"
  }
}

data "ignition_systemd_unit" "kubelet_prometheus_worker_service" {
  count   = "${length(var.prometheus_worker_domains)}"
  name    = "kubelet.service"
  content = "${element(data.template_file.kubelet_prometheus_worker_service.*.rendered, count.index)}"
}

output "kubelet_prometheus_worker_service" {
  value = "${data.ignition_systemd_unit.kubelet_prometheus_worker_service.*.id}"
}
