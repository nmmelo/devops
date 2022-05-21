#/usr/bin/bash
#Para colocar a chave publica para o ansible (control-node)
#cat << EOT >> /home/vagrant/.ssh/authorized_keys
#ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDX+LnROgzQ93i1kO0O1Regm1So5jjE5MG3nU9qD6yvhaZE1opcibx0/Dqark138egMKARAVbNQhNHHBLqnsa7BoICbgGhK0wDPhuJbFwCXwFrg61ZRKAzX8hKGt3ueC1jtNPfL275qzVgPrrtn/X1N9eDnxBJCS4YkX3IzXj+sYU9zjce3GQgkwL5RGEFFEbDL8/XBmzuoy5ZW4aENVuRhedcXBpxvzGUH3qyZcoGC43LmUX9LQlMVpGYqNLR1JvelakVOBjhZFClueWebGCBd24DH+HhERnPog6WPaUu7vHx1SvkIZCvulZNTexHZPHGcSb8va01t16JNEuxNN5+t vagrant@control-node
#EOT
#yum install -y net-tool*
#yum install -y update

#cat <<EOT >> /etc/hosts
#10.2.1.2 manager
#10.2.1.3 worker1
#10.2.1.4 worker2
#EOT

#É necessário criar um utilizador sonar, porque o sonarqube não
# pode ser executado com o utilizador root

useradd sonar
yum install wget java-11-openjdk-devel unzip -y
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.4.0.54424.zip

unzip  sonarqube-9.4.0.54424.zip -d /opt
mv /opt/sonarqube-9.4.0.54424 /opt/sonarqube
chown -R sonar:sonar /opt/sonarqube

touch /etc/systemd/system/sonar.service
echo > /etc/systemd/system/sonar.service
cat <<EOT >> /etc/systemd/system/sonar.service
[Unit]
Description=Sonarqube Service
After=syslog.target network.target
[Service]
Type=forking
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
User=sonar
Group=sonar
Restart=always
[Install]
WantedBy=multi-user.target
EOT
service sonar start
sudo systemctl enable sonar


#Instalar o sonarqube scanner

wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.7.0.2747-linux.zip
unzip sonar-scanner-cli-4.7.0.2747-linux.zip -d /opt/
mv /opt/sonar-scanner-cli-4.7.0.2747-linux /opt/sonar-scanner/
sudo chown -R sonar:sonar /opt/sonar-scanner/

echo 'export PATH=$PATH:/opt/sonar-scanner/bin' | sudo  tee -a /etc/profile
#Instalar o node.js para o nosso teste

curl -sL https://rpm.nodesource.com/setup_12.x | sudo bash -
sudo yum clean all && sudo yum makecache fast
sudo yum install -y gcc-c++ make
sudo yum install nodejs -y

