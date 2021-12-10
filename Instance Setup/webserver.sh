#!/bin/bash
apt update
apt upgrade -y
apt install awscli -y
apt install openjdk-11-jdk -y
apt install git
git config --global user.name "Brian"
git config --global user.email "brian.james.gomes@gmail.com"
cd /opt
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.56/bin/apache-tomcat-9.0.56.tar.gz
tar -xzvf apache-tomcat-9.0.56.tar.gz
mv apache-tomcat-9.0.56 tomcat

