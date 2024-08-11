#!/bin/bash
aws s3 sync s3://gokul-artifact/myartifact/ /home/ec2-user/myartifact/
mv /home/ec2-user/myartifact/target/spring-petclinic-3.3.0-SNAPSHOT.jar /home/ec2-user/app/
sudo systemctl daemon-reload
sudo systemctl start my-java-app.service
sudo systemctl enable my-java-app.service
nohup java -jar /home/ubuntu/app/spring-petclinic-3.3.0-SNAPSHOT.jar.jar > /home/ubuntu/app/application.log 2>&1 &
