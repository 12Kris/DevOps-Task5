#!/bin/bash

apt update -y
apt install -y awscli

sudo mkdir -p /home/ubuntu/folder1
sudo mkdir -p /home/ubuntu/folder2

sudo touch /home/ubuntu/folder1/test.txt

cat << 'EOF' > /home/ubuntu/move-files.sh

SRC_DIR="/home/ubuntu/folder1"
DEST_DIR="/home/ubuntu/folder2"


while true; do
    if [ "$(ls -A $SRC_DIR 2>/dev/null)" ]; then
        sudo mv $SRC_DIR/* $DEST_DIR/
    fi
    sleep 2
done
EOF

chmod +x /home/ubuntu/move-files.sh

cat << 'EOF' > /etc/systemd/system/move-files.service
[Unit]
Description=Move files from folder1 to folder2
After=network.target

[Service]
ExecStart=/home/ubuntu/move-files.sh
Restart=always
User=ubuntu

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl start move-files.service
systemctl enable move-files.service

sudo chown -R ubuntu:ubuntu /home/ubuntu/folder1 /home/ubuntu/folder2
sudo chmod -R 755 /home/ubuntu/folder1 /home/ubuntu/folder2
