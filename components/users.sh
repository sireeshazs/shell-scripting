#!/bin/bash

source components/common.sh

DOMAIN="zsdevops01.online"

OS_PREREQ

Head "Installing Maven & java"
apt install maven -y &>>$LOG
apt install openjdk-8-dk &>>$LOG
Stat $?

DOWNLOAD_COMPONENT

cd users

Head "Setup SystemD Service"
mv systemd.service /etc/systemd/system/users.service && systemctl daemon-reload && systemctl start users && systemctl enable login &>>$LOG
Stat $?


