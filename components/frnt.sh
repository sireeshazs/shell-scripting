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

if [ "${path}" = "var/www/html" ]; then
  cd /etc/nginx/sites-available && sed -i 's|/var/www/html|/var/www/html/vue/frontend/dist|g' default 
  else
    echo -e "\e[1;31m FAILURE\e[0m"
  exit 1
fi