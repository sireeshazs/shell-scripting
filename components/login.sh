#!/bin/bash

source components/common.sh

DOMAIN="zsdevops01.online"

OS_PREREQ

Head "Installing Golang"
apt install golang -y &>>$LOG
Stat $?

cd /home/ubuntu

DOWNLOAD_COMPONENT

Head "Change The Path"
cd login && export GOPATH=/go && go build
Stat $?


Head "Setup SystemD Service"
mv systemd.service /etc/systemd/system/login.service && systemctl daemon-reload && systemctl start login && systemctl enable login &>>$LOG
Stat $?

