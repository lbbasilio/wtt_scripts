#!/bin/sh
pipe=/home/ubuntu/minecmd
if [ ! -p "$pipe" ]; then
	mkfifo $pipe 
fi
cd /home/ubuntu/server
tail -n +1 -f $pipe | java -Xmx3072M -Xms3072M -jar server.jar nogui > /home/ubuntu/log.txt &
