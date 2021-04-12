#!/usr/bin/bash
apt-get -y update 
git clone git://github.com/mininet/mininet
cd mininet
git tag 
git checkout -b mininet-2.3.0 2.3.0
cd ..
PYTHON=python3 mininet/util/install.sh -n -s /home/vagrant/working_directory/mininet -a
rm -rf /home/vagrant/mininet
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
rm get-docker.sh
usermod -aG docker vagrant
source /home/vagrant/.profile
docker network create --subnet=172.18.0.0/16 docker_network
apt-get install -y hping3
wget https://raw.githubusercontent.com/christianojunior/sflow-ryu_lab/main/files/dockerfiles/sflow/Dockerfile -P /home/vagrant/working_directory/sflow
wget https://raw.githubusercontent.com/christianojunior/sflow-ryu_lab/main/files/dockerfiles/ryu/Dockerfile -P /home/vagrant/working_directory/ryu
