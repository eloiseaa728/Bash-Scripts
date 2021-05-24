# Bash-Scripts

## autoupdater.sh
Use as a cron job to automatically update, works with a discord webhook. Automatically restarts when needed.

## mount-checker.sh
Use as a cron job (every 2 minutes or so) in order to ensure the network drive is connected, checks for .online in the root directory. Uses a systemd mount to try and reconnect. Notifies discord upon disconnect. Currently no retry limit - code in if needed, I am just using it locally so it's not the end of the world if it spam connects but if you are systemd mounting something over the internet this could prove controversial.
