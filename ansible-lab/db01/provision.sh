#/bin/sh
#cat << EOT >> /home/vagrant/.ssh/authorized_keys
#ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3MFoyTfe243GDS+ibxWP2YeEZHcZt0HTVzhJJ6S/J32CIGeisv3dq1I2NEgPpjWHRfyx8t/qGF27Ajm0p5wgOwJ8nr543E6GRK6WW/Kwcu4UVA/FHD0bJZi0Kod7GIWNVJ0yQSSV8OBiWYIqb6boO48M2vJcBVqhIJmIEje5jEuQ8lq/oa2KGzhVZQADF1Ev1rWsaG8OPJ/O2PlC2/zNfJvj+WBWcn24W7zLsL3yawgGZoSsRJAFf/yghwNFIK+khWQxKaM5CDK0IFjxg4Tbd+yipIoxMDzwTWCx+gU0YWWYo7UQGrv4U/Uk48djWmsWYoYcm6lAoeORnfXBJ5SkF vagrant@control-node
#EOT
yum install -y net-tool*
yum install -y update
cat <<EOT >> /etc/hosts
10.1.1.2 control-node
10.1.1.3 app01
10.1.1.4 db01
EOT