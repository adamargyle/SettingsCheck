#!/bin/bash
# 2018-07-11
# Script to check security settings and name

# check if firmware password is active
firmwarepasswd -check

# check to see if filevault is active
fdesetup isactive

# check admin users
dscl . -read /Groups/admin GroupMembership

#check computer name
scutil --get ComputerName 
scutil --get LocalHostName 
scutil --get HostName 

exit 0