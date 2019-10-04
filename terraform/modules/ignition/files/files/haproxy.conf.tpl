global
   log /dev/log  local0
   stats socket /var/run/haproxy-admin.sock mode 660 level admin
   stats timeout 30s

defaults
  log global
  mode  http
  option  httplog
  option  dontlognull
  timeout connect 50s
  timeout client  1800s
  timeout server  1800s
  timeout http-request 15s
  timeout http-keep-alive 15s

listen stats
  bind    *:${haproxy_stats_port}
  mode    http
  stats   enable
  stats   hide-version
  stats   uri       /stats
  stats   refresh   30s
  stats   realm     Haproxy\ Statistics
  stats   auth      ${haproxy_stats_user}:${haproxy_stats_password}

# We want to make sure external address is not allowed
# Unfortunately we cannot do it through binding as this frontend
# needs to be able to listen in the VIP address that won't be always
# available (it is only in one of the three controllers). Hence
# we go the ACL route here.
frontend k8s-api
  bind *:${haproxy_apiserver_port}
  mode tcp
  option tcplog
  acl network_allowed src 192.168.1.0/24
  tcp-request connection reject if !network_allowed
  tcp-request inspect-delay 5s
  default_backend k8s-api

backend k8s-api
  mode tcp
  option tcplog
  option tcp-check
  balance roundrobin
  default-server inter 10s downinter 5s rise 2 fall 2 slowstart 60s maxconn 250 maxqueue 256 weight 100
${backends}
