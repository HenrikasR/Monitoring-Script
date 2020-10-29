#!/bin/bash

while [ true ]
do
	if [[ $(systemctl is-active nginx) == "active" ]]
	then
		echo "Service is running ($(date))" >> /home/ubuntu/logs.txt
	else
		echo "Starting the service ($(date))" >> /home/ubuntu/logs.txt
		systemctl restart nginx
		echo "Restart has happened at $(date)" >> /home/ubuntu/logs.txt
	fi
	sleep 5
done
