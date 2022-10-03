#!/bin/bash

##Copy defualt file and change the document root and server name to sales.example.com
#CREATE COPY IN CSCI3600 BEFORE RUNNING
WEBDIR=/var/www/html
CONFDIR=/etc/apache2/sites-available
TEMPLATE=/home/bryce/CSCI_3600_SCRIPTS/WStemplate.txt

sudo mkdir -p /var/www/$1/public_html
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/$1.conf
cd $CONFDIR
sed -n ' p ' 000-default.conf | sed 's/^$/#/' | nl