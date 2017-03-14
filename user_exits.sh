#!/bin/bash

read -p "Your user: "  username
if id -u $username >/dev/null 2>&1; then
###user exits   
	echo "1"
else
###user dont exits
   echo "no: 0"
fi

