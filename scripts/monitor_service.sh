#!/bin/bash

# Define variables
JAR_PATH="/home/ubuntu/app/your-application.jar"
LOG_FILE="/home/ubuntu/app/application.log"
PROCESS_NAME="java -jar $JAR_PATH"

# Function to check if the JAR application is running
check_process() {
    # Check if the process is running by searching for the JAR in the process list
    if pgrep -f "$PROCESS_NAME" > /dev/null; then
        echo "$(date): Application is running."
        return 0
    else
        echo "$(date): Application is not running."
        return 1
    fi
}

# Main logic
if check_process; then
    echo "$(date): Monitoring check passed." >> $LOG_FILE
else
    echo "$(date): Monitoring check failed. Restarting application." >> $LOG_FILE
    # Restart the application
    nohup java -jar $JAR_PATH > $LOG_FILE 2>&1 &
    if check_process; then
        echo "$(date): Application restarted successfully." >> $LOG_FILE
    else
        echo "$(date): Failed to restart application." >> $LOG_FILE
        exit 1
    fi
fi
