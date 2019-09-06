[Unit]
Description=Gluster service
After=docker.service
Requires=docker.service

[Service]
TimeoutStartSec=20m
ExecStartPre=/usr/bin/mkdir --parent /data-a/etc-glusterfs /data-a/var-lib-glusterd /var/log/glusterfs /data-a/gluster /data-b/gluster /data-c/gluster
ExecStartPre=-/usr/bin/docker rm gluster
ExecStartPre=/bin/sh -c 'while ! /usr/bin/docker pull gluster/gluster-centos:${gluster_version}; do sleep 1; done'
ExecStart=/usr/bin/docker run \
    --name gluster \
    --rm \
    --privileged=true \
    --net=host \
    -v /data-a/etc-glusterfs:/etc/glusterfs:z \
    -v /data-a/var-lib-glusterd:/var/lib/glusterd:z \
    -v /var/log/glusterfs:/var/log/glusterfs:z \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    -v /dev/:/dev \
    -v /data-a/gluster:/data-a/gluster:z \
    -v /data-b/gluster:/data-b/gluster:z \
    -v /data-c/gluster:/data-c/gluster:z \
    gluster/gluster-centos:${gluster_version}
ExecStop=/usr/bin/docker stop gluster

[Install]
WantedBy=multi-user.target
