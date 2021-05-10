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

Head "Change The Path"
cd /etc/nginx/sites-available && sed -i 's|/var/www/html|/var/www/html/vue/frontend/dist|g' default 
Stat $?

DOWNLOAD_COMPONENT

Head "Extract Downloaded Archive"
cd /var/www/html && rm -rf vue && mkdir vue && cd vue && unzip -o /tmp/frontend.zip &>>$LOG && rm -rf frontend.zip && rm -rf frontend && mv frontend-main frontend && cd frontend
Stat $?

Head "update end points in service file"
cd /var/www/html/vue/frontend
export AUTH_API_ADDRESS=http://login.${DOMAIN}:8080
export TODOS_API_ADDRESS=http://todo.${DOMAIN}:8080
Stat $?

Head "update frontend configuration"
cd /var/www/html/vue/frontend  && sudo npm install --unsafe-perm sass sass-loader node-sass wepy-compiler-sass &>>$LOG && npm run build &>>$LOG 
Stat $?

Head "Start Npm service"
npm start 
Stat $?
















