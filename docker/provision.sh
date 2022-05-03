#/bin/bash
cat << EOT >> /home/vagrant/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDX+LnROgzQ93i1kO0O1Regm1So5jjE5MG3nU9qD6yvhaZE1opcibx0/Dqark138egMKARAVbNQhNHHBLqnsa7BoICbgGhK0wDPhuJbFwCXwFrg61ZRKAzX8hKGt3ueC1jtNPfL275qzVgPrrtn/X1N9eDnxBJCS4YkX3IzXj+sYU9zjce3GQgkwL5RGEFFEbDL8/XBmzuoy5ZW4aENVuRhedcXBpxvzGUH3qyZcoGC43LmUX9LQlMVpGYqNLR1JvelakVOBjhZFClueWebGCBd24DH+HhERnPog6WPaUu7vHx1SvkIZCvulZNTexHZPHGcSb8va01t16JNEuxNN5+t vagrant@control-node
EOT

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo systemctl start docker
sudo systemctl enable docker


