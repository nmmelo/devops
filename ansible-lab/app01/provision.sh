#/bin/sh
cat << EOT >> /home/vagrant/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDX+LnROgzQ93i1kO0O1Regm1So5jjE5MG3nU9qD6yvhaZE1opcibx0/Dqark138egMKARAVbNQhNHHBLqnsa7BoICbgGhK0wDPhuJbFwCXwFrg61ZRKAzX8hKGt3ueC1jtNPfL275qzVgPrrtn/X1N9eDnxBJCS4YkX3IzXj+sYU9zjce3GQgkwL5RGEFFEbDL8/XBmzuoy5ZW4aENVuRhedcXBpxvzGUH3qyZcoGC43LmUX9LQlMVpGYqNLR1JvelakVOBjhZFClueWebGCBd24DH+HhERnPog6WPaUu7vHx1SvkIZCvulZNTexHZPHGcSb8va01t16JNEuxNN5+t vagrant@control-node
EOT
#cat <<EOT >> /etc/hosts
#10.1.1.2 control-node
#10.1.1.3 app01
#10.1.1.4 db01
#EOT