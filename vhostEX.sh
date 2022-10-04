#!/bin/bash

if [[ $1 == [(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~?&//=]*) ]]; then

    WEBDIR=/var/www/html/$1
    CONFDIR=/etc/apache2/sites-available
    CONFFILE=$CONFDIR/$1.conf

    sed -nf vh.sed 000\-default.conf                            
    [ -e 'template.txt'$'\r' ] && mv 'template.txt'$'\r' template.txt

    TEMPLATE=$PWD/template.txt
    [ -d $CONFDIR ] || mkdir -P $CONFDIR
    sed s/www.example.com/$1/ $TEMPLATE > $CONFFILE            
    mkdir -p $WEBDIR
    echo "New site for $1" > $WEBDIR/index.html
    read -p "Do you want to restrict access to this site? y/n "
    [ $REPLY = 'n' ] && exit 0

    read -p "Which network do you want retrict access to: " NETWORK 
    inet=$(ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
    sed -i "/<\/VirtualHost>/i <Directory $WEBDIR >\
        \n Order allow,deny\
        \n Allow from 127.0.0.1\
        \n Allow from $NETWORK\
        \n</Directory>" $CONFFILE

    sed -i "6i $inet \t$1" /etc/hosts
    sudo a2ensite $1.conf
    sudo service apache2 restart

else
    echo "INVALID WEBSITE INPUT TRY AGAIN."
    exit 1
fi