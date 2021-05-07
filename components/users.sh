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

Head "Extract Downloaded Archive"
cd /home/ubuntu && rm -rf user && unzip -o /tmp/user.zip &>>$LOG && mv user-main user && cd /home/ubuntu/user &&  mvn clean package  &>>$LOG
Stat $?


