vrrp_script haproxy-check {
    # keepalived resolves links and using nc directly
    # well with alpine's busybox command
    script "/opt/check-tcp-port 127.0.0.1 ${haproxy_apiserver_port}"
    interval 2
    weight 20
}

vrrp_instance haproxy-vip {
    state BACKUP
    priority 101
    interface ${interface}
    virtual_router_id ${virtual_router_id}
    advert_int 1

    # Using multicast to communicate between keepalived
    # VRRP nodes. We don't have any restriction that does
    # not let us do this and it facilitates a lot the
    # configuration via Terraform as we don't have to
    # explicitly write peers IPs. This may change in the
    # future as we may set IPs through Terraform...

    virtual_ipaddress {
        ${virtual_ipaddress}
    }

    track_script {
        haproxy-check weight 20
    }
}
