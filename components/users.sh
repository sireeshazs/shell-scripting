#!/bin/bash

source components/common.sh

DOMAIN="zsdevops01.online"

OS_PREREQ

Head "Installing Maven"
apt install maven -y &>>$LOG
Stat $?

Head "Installing Java"
apt install openjdk-8-jdk
DOWNLOAD_COMPONENT

cd users

Head "Setup SystemD Service"
mv systemd.service /etc/systemd/system/users.service && systemctl daemon-reload && systemctl start users && systemctl enable login &>>$LOG
Stat $?


