#!/bin/bash
WEBHOOK_URL="https://discord.com/api/webhooks/abcde/abcde"
apt update

check=$(apt-get upgrade --simulate)

if [[ $check == *"0 upgraded"* ]]
then
	echo "No updates.."
	exit
else
	curl -H "Content-Type: application/json" -d '{"username": "<<enter username>>", "content": "Update in progress..."}' $WEBHOOK_URL
	apt upgrade -y
	apt autoclean
	curl -H "Content-Type: application/json" -d '{"username": "<<enter username>>", "content": "Update complete."}' $WEBHOOK_URL
	if test -f "/var/run/reboot-required"; then
		reboot
		curl -H "Content-Type: application/json" -d '{"username": "<<enter username>>", "content": "Requires restart.\n Restarting..."}' $WEBHOOK_URL
	else
		exit
	fi
fi
