#!/bin/bash

#User automation script
#mbleakley625

while true;
do
	echo "User creation/mod: 
		1.) List Users
		2.) Create Users
		3.) Delete Users
		4.) List Groups
		5.) Create Groups
		6.) Delete Group
		7.)Change User Password"

	read CHOICE

	if [[ $CHOICE -eq 1 ]]; then
		cat /etc/passwd | cut -d':' -f1
	elif [[ $CHOICE -eq 2 ]]; then	
		while true;
		do
			if [ $(id -u) -eq 0 ]; then
				read -p "Enter username : " USERNAME
				read -s -p "Enter password : " PASSWORD
				#perl command that encrypts the password
				PASS=$(perl -e 'print crypt($ARGV[0], "password")' $PASSWORD)
				useradd -m -p "$PASS" "$USERNAME"
		
			else
				echo "Only root may add a user to the system."
				exit 2
			fi
			read -p "Would you like to add another user? y/n " val
			if [ "$val" = "n" ] || [ "$val" = "N" ];then
				break
			elif [ "$val" = "y" ] || ["$val" = "Y" ]; then
				echo "okey dokey"
			else
				exit 2 	
			fi
		done
	elif [[ $CHOICE -eq 3 ]]; then
		while true;
		do
			if [ $(id -u) -eq 0 ]; then
				read -p "Enter username : " USERNAME
				userdel "$USERNAME"
		
			else
				echo "Only root may delete a user on the system."
				exit 2
			fi
			read -p "Would you like to delete another user? y/n " val
			if [ "$val" = "n" ] || [ "$val" = "N" ];then
				break
			elif [ "$val" = "y" ] || ["$val" = "Y" ]; then
				echo "okey dokey"
			else
				exit 2 	
			fi
		done

	elif [[ $CHOICE -eq 4 ]];then
		cat /etc/group | cut -d':' -f1
	
	elif [[$CHOICE -eq 5 ]]; then
			while true;
		do
			if [ $(id -u) -eq 0 ]; then
				read -p "Enter groupname : " GROUPNAME
				groupadd $GROUPNAME
		
			else
				echo "Only root may add a group to the system."
				exit 2
			fi
			read -p "Would you like to add another group? y/n " val
			if [ "$val" = "n" ] || [ "$val" = "N" ];then
				break
			elif [ "$val" = "y" ] || ["$val" = "Y" ]; then
				echo "okey dokey"
			else
				exit 2 	
			fi
		done
	elif [[ $CHOICE -eq 6 ]];then
		while true;
		do
			if [ $(id -u) -eq 0 ]; then
				read -p "Enter groupname : " GROUPNAME
				groupdel GROUPNAME
		
			else
				echo "Only root may delete a group from the system."
				exit 2
			fi
			read -p "Would you like to delete another group? y/n " val
			if [ "$val" = "n" ] || [ "$val" = "N" ];then
				break
			elif [ "$val" = "y" ] || ["$val" = "Y" ]; then
				echo "okey dokey"
			else
				exit 2 	
			fi
		done
	elif [[ $CHOICE -eq 7 ]];then
		while true;
		do
			if [ $(id -u) -eq 0 ]; then
				read -p "Enter username : " USERNAME
				passwd $USERNAME
		
			else
				echo "Only root may change the password from a user."
				exit 2
			fi
			read -p "Would you like to change another password? y/n " val
			if [ "$val" = "n" ] || [ "$val" = "N" ];then
				break
			elif [ "$val" = "y" ] || ["$val" = "Y" ]; then
				echo "okey dokey"
			else
				exit 2 	
			fi
		done
	fi
done





