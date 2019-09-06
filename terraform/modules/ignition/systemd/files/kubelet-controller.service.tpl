[Unit]
Description=Kubelet via Hyperkube
Wants=rpc-statd.service
[Service]
EnvironmentFile=/etc/kubernetes/kubelet.env
Environment="RKT_RUN_ARGS=--uuid-file-save=/var/cache/kubelet-pod.uuid \
  --volume=resolv,kind=host,source=/etc/resolv.conf \
  --mount volume=resolv,target=/etc/resolv.conf \
  --volume var-lib-cni,kind=host,source=/var/lib/cni \
  --mount volume=var-lib-cni,target=/var/lib/cni \
  --volume var-lib-calico,kind=host,source=/var/lib/calico \
  --mount volume=var-lib-calico,target=/var/lib/calico \
  --volume opt-cni-bin,kind=host,source=/opt/cni/bin \
  --mount volume=opt-cni-bin,target=/opt/cni/bin \
  --volume var-log,kind=host,source=/var/log \
  --mount volume=var-log,target=/var/log \
  --insecure-options=image"
ExecStartPre=/bin/mkdir -p /opt/cni/bin
ExecStartPre=/bin/mkdir -p /etc/kubernetes/manifests
ExecStartPre=/bin/mkdir -p /etc/kubernetes/cni/net.d
ExecStartPre=/bin/mkdir -p /etc/kubernetes/checkpoint-secrets
ExecStartPre=/bin/mkdir -p /etc/kubernetes/inactive-manifests
ExecStartPre=/bin/mkdir -p /var/lib/cni
ExecStartPre=/bin/mkdir -p /var/lib/calico
ExecStartPre=/bin/mkdir -p /var/lib/kubelet/volumeplugins
ExecStartPre=/usr/bin/bash -c "grep 'certificate-authority-data' /etc/kubernetes/kubeconfig | awk '{print $2}' | base64 -d > /etc/kubernetes/ca.crt"
ExecStartPre=-/usr/bin/rkt rm --uuid-file=/var/cache/kubelet-pod.uuid
ExecStart=/usr/lib/coreos/kubelet-wrapper \
  --anonymous-auth=false \
  --authentication-token-webhook \
  --authorization-mode=Webhook \
  --client-ca-file=/etc/kubernetes/ca.crt \
  --cluster_dns=${k8s_dns_service_ip} \
  --cluster_domain=${cluster_domain_suffix} \
  --cni-conf-dir=/etc/kubernetes/cni/net.d \
  --exit-on-lock-contention \
  --hostname-override=${domain_name} \
  --kubeconfig=/etc/kubernetes/kubeconfig \
  --lock-file=/var/run/lock/kubelet.lock \
  --network-plugin=cni \
  --node-labels=node-role.kubernetes.io/master \
  --node-labels=node-role.kubernetes.io/controller="true" \
  --pod-manifest-path=/etc/kubernetes/manifests \
  --register-with-taints=node-role.kubernetes.io/master=:NoSchedule \
  --volume-plugin-dir=/var/lib/kubelet/volumeplugins
ExecStop=-/usr/bin/rkt stop --uuid-file=/var/cache/kubelet-pod.uuid
Restart=always
RestartSec=10
[Install]
WantedBy=multi-user.target
