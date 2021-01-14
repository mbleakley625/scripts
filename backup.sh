#!/bin/bash
#basic backup script. Can be easily modified to use send backup to remote host w/ netcat. However, I would recommend to use rsync instead.
#mbleakley625

if [ "$1" = "backup" ]; then
	echo "backing up $2"
	#tar cz $2 | netcat 10.0.0.225 1234
       	tar czf /var/backups/$(date "+%d-%m-%Y-%H-%M") $2
	echo "Saved in: " $(find /var/backups/ -name $(date "+%d-%m-%Y-%H-%M"))
elif [ "$1" = "restore" ]; then
	echo "restoring local backup $2"
	tar xvf $2
else
	echo "Invalid arg"
fi




