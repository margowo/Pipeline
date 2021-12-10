#!/bin/bash
apt update
apt upgrade -y
apt install apache2 -y
systemctl start apache2
systemctl enable apache2
apt install awscli -y
apt install openjdk-11-jdk -y
apt install git
git config --global user.name "mary"
git config --global user.email "m.margo@me.com"
git config --global credential.helper store
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | tee \
        /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
        https://pkg.jenkins.io/debian-stable binary/ | tee \
        /etc/apt/sources.list.d/jenkins.list > /dev/null
apt-get update
apt-get install jenkins -y
apt install docker.io -y
git clone https://github.com/margowo/Pipeline.git
cd /opt
wget https://dlcdn.apache.org/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz
tar -xzvf apache-maven-3.8.4-bin.tar.gz
mv apache-maven-3.8.4 maven
rm -rf apache-maven-3.8.4-bin.tar.gz
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
mv /tmp/eksctl /usr/local/bin
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
cat /var/lib/jenkins/secrets/initialAdminPassword
