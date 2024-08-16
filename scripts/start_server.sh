#!/bin/bash
sudo systemctl daemon-reload
sudo systemctl start my-app-java.service
sudo systemctl enable my-app-java.service
nohup java -jar /home/ubuntu/app/*.jar > /home/ubuntu/app/application.log 2>&1 &
