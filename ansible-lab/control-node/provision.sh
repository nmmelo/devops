#!/usr/bin/env bash
sudo yum -y install epel-release
echo "inicio da instalacao do ansible"
sudo yum -y install ansible
cat <<EOT >> /etc/hosts
10.1.1.2 control-node
10.1.1.3 app01
10.1.1.4 db01
10.1.1.5 docker01
EOT