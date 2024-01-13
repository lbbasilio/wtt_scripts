#!/bin/sh

echo "/stop" > /home/ubuntu/minecmd
sleep 15
mv /home/ubuntu/log.txt /home/ubuntu/log_old.txt
exit 0
