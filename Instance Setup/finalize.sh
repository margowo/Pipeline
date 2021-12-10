#!/bin/bash
sudo usermod -aG docker $USER
sudo usermod -aG docker jenkins
export PATH=/opt/maven/bin:$PATH
sudo service jenkins restart
sudo cat /var/lib/jenkins/secrets/initialAdminPassword