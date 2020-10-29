#!/bin/bash

while [ true ]
do
	if [[ $(systemctl is-active nginx) == "active" ]]
	then
		echo "Service is running"
	else
		echo "Starting the service"
		systemctl restart nginx
		echo "Restart has happened at $(date)" >> logs.txt
	fi
	sleep 5
done
