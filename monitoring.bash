#!/bin/bash
FILE=/home/ubuntu/.hidden-file
if [ -f "$FILE" ]; then
echo "Unexpected restart happened at: $(cat -n 1 /home/ubuntu/.hidden-file)" >> /home/ubuntu/unexpected-restart.txt
rm -f $FILE
fi

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
	date > /home/ubuntu/.hidden-file
done
