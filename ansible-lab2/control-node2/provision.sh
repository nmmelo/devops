#!/usr/bin/env bash
echo "fazer update ao SO"
sudo apt-get update -y
echo "Instalar o software-properties-common"
sudo apt-get install software-properties-common -y
echo "colocar o repositorio do ansible"
sudo add-apt-repository --yes --update ppa:ansible/ansible
echo "Instalar o ansible no Ubuntu OS"
sudo apt-get install ansible -y
cat <<EOT >> /etc/hosts
10.1.1.2 control-node
10.1.1.3 app01
10.1.1.4 db01
10.1.1.5 docker01
10.1.1.6 control-node2
EOT