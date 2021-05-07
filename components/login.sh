#!/bin/bash

source components/common.sh

DOMAIN="zsdevops01.online"

OS_PREREQ

Head "Installing Golang"
apt install golang -y &>>$LOG
Stat $?

DOWNLOAD_COMPONENT

Head "Change The Path"
cd login && export GOPATH=/go
Stat $?


