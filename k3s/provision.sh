#/bin/bash
#Para colocar a chave publica para o ansible (control-node)
cat << EOT >> /home/vagrant/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDoMAbVt7r2L74/nuOLiVXyTKvmPmiU0aoUd8OS7m+Zf5sCE7V5+45SSMeHUeyBI8krkaMnqecbweiK/KGIUl5HyYVoCSIPx4AOiBZxk+maGQNq/kY9ch6NW2ToGnjW7W3UBuGi8yrgR4/5/dvCztbUkS5HQJXKCIYivOItI1k25IVA9+OJh+yYMZHsn43P7o2jNhgWPBQlVR8VQ01d9wiBT9kirlJ0BiIuyfyToIMDBHmCCFPzZu5B8XcMMBlD8rQegF5PzXzsI04ELew34e87lUCrUqQWqG05UOSaV+tZo/tptxyV8c6bcEZg2NfMBFR+F38y4YnPRBG1sl8bvaGN vagrant@control-node
EOT
#yum install -y net-tool*
#yum install -y update

cat <<EOT >> /etc/hosts
10.1.1.2 control-node
10.2.1.10 sonar
10.2.1.11 jenkins-srv01
10.3.1.2 manager
10.3.1.3 worker1
10.3.1.4 prometheus
EOT