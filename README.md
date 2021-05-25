# edgerouter-load-balancing-notification
Get a notification when the load balancer changes

For example when a WAN interface is going offline and the failover is activated. 

It is sending a message to:
- Mail
- Telegram
- Logfile

It has been tested on:
- EdgeRouter 12p
- EdgeRouter SFP X

It should work on any Ubiquiti device as long as it supports a load balancing functionality

The manual can be found on top of the script where the setup and configuration part is available:
https://github.com/dennisb1/edgerouter-load-balancing-notification/blob/main/notification.sh

You can test the script with the following command from the commandline:

  /config/scripts/notification.sh G eth0 inactive

Please consider to make a donation for the work and effort put in this usefull script.
You can donate to:

- Bitcoin:  13RJEUDVheyjhMLgjBY7v7j9hHgQyyD5Ey
- Ethereum: 0x03464D632180c589DB23638Ec3b867aeacd3e8C6


Thanks to the following people to make a contribution (not limited to):
- SEMIJim
- smyers119
