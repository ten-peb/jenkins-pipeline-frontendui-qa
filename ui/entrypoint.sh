#!/bin/bash -xv 

# cd /var/www/html && node server.js
cd /usr/src/app && npm start 

while /bin/true
do
    echo "You should not be here. Something went wrong with the node command"
    sleep 1500
done
