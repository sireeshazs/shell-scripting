#!/bin/bash

source components/common.sh

DOMAIN="zsdevops01.online"

OS_PREREQ

Head "Installing Nginx"
apt install nginx -y &>>$LOG
Stat $?

Head "Installing Npm"
apt install npm -y &>>$LOG
Stat $?

Head "Change The Path"
cd /var/www/html && mkdir vue && cd /var/www/html/vue
Stat $?

DOWNLOAD_COMPONENTS










