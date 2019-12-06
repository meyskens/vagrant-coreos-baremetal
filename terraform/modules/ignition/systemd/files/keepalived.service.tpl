[Unit]
Description=keepalived
After=docker.service
Requires=docker.service

[Service]
TimeoutStartSec=20m
ExecStartPre=-/usr/bin/docker rm keepalived
ExecStartPre=/bin/sh -c 'while ! /usr/bin/docker pull osixia/keepalived:${keepalived_version}; do sleep 1; done'
ExecStart=/usr/bin/docker run \
  --name=keepalived \
  --cap-add=NET_ADMIN \
  --net=host \
  -v /opt/check-tcp-port:/opt/check-tcp-port:ro \
  -v /etc/keepalived/keepalived.conf:/container/service/keepalived/assets/keepalived.conf \
  --rm \
  osixia/keepalived:${keepalived_version} --copy-service
ExecStop=/usr/bin/docker stop keepalived
Restart=Always

[Install]
WantedBy=multi-user.target
