#/usr/bin/bash
#Para colocar a chave publica para o ansible (control-node)
cat << EOT >> /home/vagrant/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDX+LnROgzQ93i1kO0O1Regm1So5jjE5MG3nU9qD6yvhaZE1opcibx0/Dqark138egMKARAVbNQhNHHBLqnsa7BoICbgGhK0wDPhuJbFwCXwFrg61ZRKAzX8hKGt3ueC1jtNPfL275qzVgPrrtn/X1N9eDnxBJCS4YkX3IzXj+sYU9zjce3GQgkwL5RGEFFEbDL8/XBmzuoy5ZW4aENVuRhedcXBpxvzGUH3qyZcoGC43LmUX9LQlMVpGYqNLR1JvelakVOBjhZFClueWebGCBd24DH+HhERnPog6WPaUu7vHx1SvkIZCvulZNTexHZPHGcSb8va01t16JNEuxNN5+t vagrant@control-node
EOT
yum install -y net-tool*
yum install -y update

cat <<EOT >> /etc/hosts
10.1.1.2 control-node
10.2.1.10 sonar
10.2.1.11 jenkins-srv01
EOT

#Preparação do servidor Jenkins
