#!/bin/bash

# Sets dns to cloudflares 1.1.1.1 and 1.0.0.1

function dns {
	echo 'nameserver 1.1.1.1' > /etc/resolv.conf
	echo 'nameserver 1.0.0.1' >> /etc/resolv.conf
} 

if [ $(whoami) == "root" ]; then
	dns
else
	echo 'Sorry, got to be root!'
	exit 0
fi


