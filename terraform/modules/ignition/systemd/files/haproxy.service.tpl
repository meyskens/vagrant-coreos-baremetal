[Unit]
Description=haproxy
After=docker.service
Requires=docker.service

[Service]
TimeoutStartSec=20m
ExecStartPre=-/usr/bin/docker rm haproxy
ExecStartPre=/bin/sh -c 'while ! /usr/bin/docker pull srcd/haproxy-syslogd:${haproxy_syslogd_version}; do sleep 1; done'
ExecStart=/usr/bin/docker run \
  --rm \
  -v /etc/haproxy/haproxy.conf:/usr/local/etc/haproxy/haproxy.cfg:ro \
  -p ${haproxy_apiserver_port}:${haproxy_apiserver_port} \
  -p ${haproxy_stats_port}:${haproxy_stats_port} \
  --name haproxy \
  srcd/haproxy-syslogd:${haproxy_syslogd_version}
ExecStop=/usr/bin/docker stop haproxy
Restart=Always

[Install]
WantedBy=multi-user.target
