#!/bin/bash
#Perform initial checks on the VM env.

LOGS='/vagrant/logs/apache2'

if [ ! -d "$LOGS" ]; then
    # Control will enter here if $LOGS doesn't exist.
    mkdir -p "$LOGS"
    #restart apache2
    /etc/init.d/apache2 restart
fi

exit 0
