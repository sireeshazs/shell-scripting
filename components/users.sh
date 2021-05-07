#!/bin/bash

source components/common.sh

DOMAIN="zsdevops01.online"

OS_PREREQ

Head "Installing Java"
apt install openjdk-8-jdk -y &>>$LOG
Stat $?

Head "Installing Maven"
apt install maven -y &>>$LOG
Stat $?

DOWNLOAD_COMPONENT

cd users

Head "Build The Code"
mvn clean package &>>$LOG
Stat $?

Head "Setup SystemD Service"
mv systemd.service /etc/systemd/system/users.service && systemctl daemon-reload && systemctl start users && systemctl enable login &>>$LOG
Stat $?


