#!/bin/sh

PS_ALL=`docker ps -a -q`

if [ ${#PS_ALL} -eq 0 ]; then
	echo "There is no docker containers!"
else
	docker rm $PS_ALL
fi
