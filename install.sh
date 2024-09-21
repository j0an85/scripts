#!/bin/bash
apt update && apt install -y sudo
usermod -aG sudo serveradmin
# exit and log back into ssh
#insta;;ar Docker
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
apt-get update
apt-get install ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc


echo \
 "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
 $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update

apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

groupadd docker
usermod -aG docker serveradmin #$USER
newgrp docker

chmod -R 755 /opt/ && chown -R 1000:1000 /opt/

exit

mkdir -p /opt/dockerdata /opt/stacks/duplicaty /opt/mediastorage /opt/cctvstorage 
nano /opt/stacks/duplicaty/docker-compose.yaml
#docker compose -f /opt/stacks/duplicaty/docker-compose.yaml  up -d






