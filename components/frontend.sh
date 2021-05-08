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

Head "Extract Downloaded Archive"
cd /home/ubuntu && rm -rf frontend && unzip -o /tmp/frontend.zip &>>$LOG && mv frontend-main frontend && cd /home/ubuntu/frontend && npm build && npm start &>>$LOG
Stat $?

Head "Update EndPoints in Service File"
sed -i -e "s/users_endpoint/users.venu6776.tk/" /home/ubuntu/login/systemd.service
Stat $?

Head "Setup SystemD Service"
mv /home/ubuntu/frontend/systemd.service /etc/systemd/system/frontend.service && systemctl daemon-reload && systemctl start nginx && systemctl enable nginx &>>$LOG
Stat $?


Head "Restart Nginx Service"
systemctl restart nginx
Stat $?














