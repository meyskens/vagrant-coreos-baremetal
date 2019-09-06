[Mount]
What=/dev/disk/by-label/${label}
Where=${where}
Type=${type}

[Install]
WantedBy=local-fs.target
