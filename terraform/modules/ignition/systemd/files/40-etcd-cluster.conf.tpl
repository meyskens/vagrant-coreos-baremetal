[Service]
Environment="ETCD_IMAGE_TAG=${etcd_image_tag}"
Environment="ETCD_NAME=${etcd_name}"
Environment="ETCD_ADVERTISE_CLIENT_URLS=https://${etcd_fqdn}:2379"
Environment="ETCD_INITIAL_ADVERTISE_PEER_URLS=https://${etcd_fqdn}:2380"
Environment="ETCD_LISTEN_CLIENT_URLS=${etcd_listen_client_urls}"
Environment="ETCD_LISTEN_PEER_URLS=${etcd_listen_peers_urls}"
Environment="ETCD_LISTEN_METRICS_URLS=${etcd_listen_metrics_urls}"
Environment="ETCD_INITIAL_CLUSTER=${etcd_initial_cluster}"
Environment="ETCD_DATA_DIR=${etcd_data_dir}"
Environment="ETCD_SSL_DIR=/etc/ssl/etcd"
Environment="ETCD_TRUSTED_CA_FILE=/etc/ssl/certs/etcd/server-ca.crt"
Environment="ETCD_CERT_FILE=/etc/ssl/certs/etcd/server.crt"
Environment="ETCD_KEY_FILE=/etc/ssl/certs/etcd/server.key"
Environment="ETCD_CLIENT_CERT_AUTH=true"
Environment="ETCD_PEER_TRUSTED_CA_FILE=/etc/ssl/certs/etcd/peer-ca.crt"
Environment="ETCD_PEER_CERT_FILE=/etc/ssl/certs/etcd/peer.crt"
Environment="ETCD_PEER_KEY_FILE=/etc/ssl/certs/etcd/peer.key"
Environment="ETCD_PEER_CLIENT_CERT_AUTH=true"
