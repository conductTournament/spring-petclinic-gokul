#!/bin/bash
pkill -f spring-petclinic-3.3.0-SNAPSHOT.jar || true
aws s3 scp s3://gokul-artifact/myartifact/ /home/ec2-user/myartifact/
mv /home/ec2-user/spring-petclinic-3.3.0-SNAPSHOT.jar /home/ec2-user/app/
sudo systemctl daemon-reload
sudo systemctl start my-java-app.service
sudo systemctl enable my-java-app.service
