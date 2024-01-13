#!/bin/sh

result_file=/tmp/server_empty
if [ ! -e "$result_file" ]; then
	echo "0" > "$result_file"
fi

last_result=$(cat /tmp/server_empty)
online_players=$(curl -s "https://api.mcsrvstat.us/3/minezada.semroque.com" | jq -r ".players.online")

if [ "$online_players" -gt 0 ]; then
	echo "0" > "$result_file"
elif [ "$last_result" -eq 0 ]; then
	echo "1" > "$result_file"
else
	shutdown +0
fi
