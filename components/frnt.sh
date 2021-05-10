#!/bin/bash

source components/common.sh

DOMAIN="sirizs.tk"

OS_PREREQ

Head "Installing Nginx"
apt install nginx -y &>>$LOG
systemctl restart nginx
Stat $?

Head "Installing Npm"
apt install npm -y &>>$LOG
Stat $?

if [ "${Change The Path}" = "var/www/html" ]; then
  success  "change the path as given below"
  exit 1
fi

Head "Change The Path"
cd /etc/nginx/sites-available && sed -i 's|/var/www/html|/var/www/html/vue/frontend/dist|g' default 
Stat $?



DOWNLOAD_COMPONENT