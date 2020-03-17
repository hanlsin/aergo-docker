#!/bin/sh

IMG_ALL=`docker images -a -q`

if [ ${#IMG_ALL} -eq 0 ]; then
	echo "There is no docker images!"
else
	docker rmi $IMG_ALL
fi
