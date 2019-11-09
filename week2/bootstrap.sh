#!/usr/bin/env bash

set -e

echo "Installing java from apt"
add-apt-repository ppa:openjdk-r/ppa -y
apt-get update
apt-get -y install openjdk-8-jdk
update-alternatives --config java

echo "Create appuser"
adduser --disabled-login --disabled-password --gecos "" appuser

echo "Fetching application from repository"
cd /home/appuser
wget https://github.com/Thoughtworks-SEA-Capability/Infrastructure-101-Practice/raw/master/week1/hello-spring-boot-0.1.0.jar

echo "Change ownership of application jar to appuser"
chown appuser:appuser /home/appuser/hello-spring-boot-0.1.0.jar

echo "Setup app.service"
mkdir -p /usr/lib/systemd/system
cat > /usr/lib/systemd/system/app.service <<- "EOF"
[Unit]
Description=Hello world app
[Service]
ExecStart=/usr/bin/java -jar /home/appuser/hello-spring-boot-0.1.0.jar --spring.config.name=test.application.properties
User=appuser
Restart=always
SuccessExitStatus=143
[Install]
WantedBy=multi-user.target
EOF

echo "Starting app"
systemctl daemon-reload
systemctl enable app
systemctl start app

