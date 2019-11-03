#!/usr/bin/env bash

set -e

echo "Installing java from apt"
add-apt-repository ppa:openjdk-r/ppa -y
apt-get update
apt-get -y install openjdk-8-jdk
update-alternatives --config java

echo "Fetching application from repository"
mkdir -p /src
cd /src
wget https://github.com/Thoughtworks-SEA-Capability/Infrastructure-101-Practice/raw/master/week1/hello-spring-boot-0.1.0.jar

echo "Setup appuser"
adduser --disabled-password --gecos "" appuser
chown -R appuser:appuser /src

echo "Setup app.service"
mkdir -p /usr/lib/systemd/system
rm -f /usr/lib/systemd/system/app.service
cp /vagrant/app.service /usr/lib/systemd/system/

echo "Starting app"
systemctl daemon-reload
systemctl enable app
systemctl start app

