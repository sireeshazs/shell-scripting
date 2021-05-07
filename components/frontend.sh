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
cd /etc/nginx/sites-available && sed -i 's|/var/www/html|/var/www/html/frontend|g' default 
Stat $?

DOWNLOAD_COMPONENT

Head "Restart Nginx Service"
systemctl restart nginx
Stat $?

Head "Setup SystemD Service"
cd /var/www/html/frontend && npm start && cd /shell-scripting &>>$LOG
Stat $?












