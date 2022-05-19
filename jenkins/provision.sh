#/bin/bash
#Para colocar a chave publica para o ansible (control-node)
#cat << EOT >> /home/vagrant/.ssh/authorized_keys
#sh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDX+LnROgzQ93i1kO0O1Regm1So5jjE5MG3nU9qD6yvhaZE1opcibx0/Dqark138egMKARAVbNQhNHHBLqnsa7BoICbgGhK0wDPhuJbFwCXwFrg61ZRKAzX8hKGt3ueC1jtNPfL275qzVgPrrtn/X1N9eDnxBJCS4YkX3IzXj+sYU9zjce3GQgkwL5RGEFFEbDL8/XBmzuoy5ZW4aENVuRhedcXBpxvzGUH3qyZcoGC43LmUX9LQlMVpGYqNLR1JvelakVOBjhZFClueWebGCBd24DH+HhERnPog6WPaUu7vHx1SvkIZCvulZNTexHZPHGcSb8va01t16JNEuxNN5+t vagrant@control-node
#EOT
#yum install -y net-tool*
#yum install -y update

#cat <<EOT >> /etc/hosts
#10.1.1.2 control-node
#10.2.1.10 sonar
#10.2.1.11 jenkins-srv01
#EOT

#Preparação do servidor Jenkins
#/bin/bash
yum install epel-release -y
yum install wget git -y
sudo wget --no-check-certificate -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install java-11-openjdk-devel -y
yum install unzip -y
yum install jenkins -y
systemctl daemon-reload
service jenkins start
#Instalação do docker engine e docker-compose
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli  containerd.io -y
sudo systemctl start docker
sudo systemctl enable docker

sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

systemctl daemon reload
systemctl restart docker
#O jenkins não consegue aceder ao docker, neste caso temos que inserior o user jenkins no grupo do docker
usermod -aG docker jenkins
sudo chmod 666 /var/run/docker.sock

#Instalar o sonarqube scanner
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.7.0.2747-linux.zip
unzip sonar-scanner-cli-4.7.0.2747-linux.zip -d /opt/
mv /opt/sonar-scanner-4.7.0.2747-linux /opt/sonar-scanner/
chown -R /opt/sonar-scanner/
echo 'export PATH=$PATH:/opt/sonar-scanner/bin' | sudo  tee -a /etc/profile

#Instalar o node.js para o nosso teste
curl -sL https://rpm.nodesource.com/setup_12.x | sudo bash -
sudo yum clean all && sudo yum makecache fast
sudo yum install -y gcc-c++ make
sudo yum install nodejs -y


