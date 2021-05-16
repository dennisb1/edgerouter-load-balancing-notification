#!/bin/bash
# /config/scripts/notification.sh
#
# Version 0.1
#
# Up to date script can be found here:
# https://github.com/dennisb1/edgerouter-load-balancing-notification
#
# Don't forget to give a donation if this script is helpful for you.
#
# Place the script in the path above.  I have my ownerships and
# permissions set to
#
#  -rwxr-x---  1 ubnt  vyattacf ...  /config/scripts/notification.sh
#
# E.g.:
#
#    sudo chown ubnt:vyattacfg /config/scripts/notification.sh
#    sudo chmod 750 /config/scripts/notification.sh
#
# To activate:
#   configure
#   set load-balance group G transition-script /config/scripts/notification.sh
#   commit
#   save
#
# where "group G" is whatever you designated your load-balance group is
#
# Configure:
#
# Do you want a mail? 1=enabled 0=disabled
#
MAIL=1
#
# Mail Configuration:
#
MAILSERVER=smtp.example.com
MAILFROM=yoursender@example.com
MAILTO=whereto@example.com
MAILLOGIN=username:password
MAILNAME=Your Name?
#
# You dont need to change this following line unless you want to.
#
MAILNAMEFROM=$(hostname)
#
# Do you want a telegram message? 1=enabled 0=disabled
#
TELEGRAM=1
#
# Telegram Configuration:
#
TELEGRAMTOKEN="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
TELEGRAMID="xxxxxxxxxxxxxx"
#
#
# NO CHANGES NEEDED BELOW THIS POINT
#


# Echo usage if no arguments passed
[ $# == 3 ] || { echo "Usage: $0 <group> <intf> <status>"; exit 1; }


GROUP=$1; INTF=$2; STATUS=$3
readonly GROUP INTF STATUS


mailmsg="Subject: ALERT: Internet Connection on $INTF status $STATUS
From: "$MAILNAMEFROM" <$MAILFROM>
To: "$MAILNAME" <$MAILTO>
Date: date -R


Interface: $INTF, Group: $GROUP, Status: $STATUS"

telegrammsg="ALERT: Internet Connection on $INTF status $STATUS"

if [ $MAIL = "1" ]
then
  curl -s smtps://$MAILSERVER --ssl-reqd \
  --mail-from $MAILFROM \
  --mail-rcpt $MAILTO \
  --user $MAILLOGIN \
  -T - <<< "$mailmsg"
fi

if [ $TELEGRAM = "1" ]
then
  curl -s -X POST https://api.telegram.org/bot$TELEGRAMTOKEN/sendMessage -d chat_id=$TELEGRAMID -d text="$telegrammsg"
fi
