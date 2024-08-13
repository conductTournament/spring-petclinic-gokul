#!/bin/bash

sudo systemctl daemon-reload
sudo systemctl stop my-app-java.service
sudo systemctl start my-app-java.service
sudo systemctl enable my-app-java.service
nohup java -jar /home/ubuntu/app/spring-petclinic-3.3.0-SNAPSHOT.jar > /home/ubuntu/app/application.log 2>&1 &
