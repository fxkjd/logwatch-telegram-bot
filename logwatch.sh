#!/bin/bash

# Credits to Neolot (original script: https://gist.github.com/Neolot/ef7fce2518a8ec71bbe09beb9381ee95)

# Config
day=$(date +%Y-%m-%d)
filename=/var/cache/logwatch/$day-logwatch.txt
token=<YOUR BOT TOKEN>
chat_id=<YOUR CHAT ID>

#Check if removed-but-not-purged
test -x /usr/share/logwatch/scripts/logwatch.pl || exit 0

#execute
/usr/sbin/logwatch --output file --filename $filename
chmod 644 $filename
mv $filename /root/logwatch_bot/logs/
curl -F chat_id="$chat_id" -F text="$(head /root/logwatch_bot/logs/$day-logwatch.txt -n 9)" https://api.telegram.org/bot$token/sendMessage >/dev/null 2>&1
curl -F chat_id="$chat_id" -F document=@"/root/logwatch_bot/logs/$day-logwatch.txt" https://api.telegram.org/bot$token/sendDocument >/dev/null 2>&1
