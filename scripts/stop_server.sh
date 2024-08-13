#!/bin/bash
pkill -f spring-petclinic-3.3.0-SNAPSHOT.jar || true
aws s3 sync s3://gokul-artifact/myartifact/ /home/ec2-user/myartifact/
mv /home/ec2-user/myartifact/target/spring-petclinic-3.3.0-SNAPSHOT.jar /home/ec2-user/app/
