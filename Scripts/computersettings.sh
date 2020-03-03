#!/bin/bash
# 2018-07-11 awickert
# set basic system settings

#set local admin
dscl . - append /Groups/admin GroupMembership $adminuser

#set hostname
scutil --set ComputerName $computername
scutil --set HostName $computername
scutil --set LocalHostName $computername

#set firmware password
doesexist=`firmwarepasswd -check`

if [ "$doesexist" = "Password Enabled: No" ]; then

/usr/bin/expect <<- DONE
	spawn firmwarepasswd -setpasswd
	expect "Enter new password:"
	send "$firmware\r";
	expect "Re-enter new password:"
	send "$firmware\r";
	expect EOF
DONE

else
	echo "Firmware Password Already Exists"
	
fi

exit 0