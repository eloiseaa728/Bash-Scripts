#!/bin/bash
WEBHOOK_URL="https://discord.com/api/webhooks/abcde/12345"
DIR=
SYSTEMD=


if test -f "/mnt/nextcloud/.online"; then
        echo "Mount online."
else
	echo "Mount offline."
	systemctl restart $SYSTEMD
	if test -f "/mnt/nextcloud/.online"; then
		curl -H "Content-Type: application/json" -d '{"username": "<<enter username>>", "content": "Nextcloud SMB Disconnected."}' $WEBHOOK_URL
	else
		echo "Mount back online."
	fi
fi
