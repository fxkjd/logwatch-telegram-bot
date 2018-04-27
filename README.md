# Logwatch Telegram Bot
This repository includes a guide to send the logwatch results to your Telegram Bot.

## Installing

### Prerequisites
The following need to be installed:

* Logwatch
* Curl

### Setting up

#### In Telegram
Create a Telegram Bot in order to obtain the `BOT TOKEN` ([More info](https://core.telegram.org/bots#6-botfather)). 

Start a conversation with your new Telegram Bot and obtain the `CHAT_ID`. You can obtain the `CHAT_ID` using the telegram API:

>$ curl https://api.telegram.org/bot<BOT TOKEN\>/getUpdates

Replace both of them in the `logwatch.sh` script.


#### In your server
Create (if not already created) the `/root/logwatch_bot/logs` and `/var/cache/logwatch/` folders.

Copy the `logwatch.sh` script in `/root/logwatch_bot` folder. Ensure it has execution permissions.

Edit the crontab.
>$ crontab -e

Add the following line to send the logwatch results every day at 8.00 AM.
> 0 8 * * * /bin/bash /root/logwatch_bot/logwatch.sh
