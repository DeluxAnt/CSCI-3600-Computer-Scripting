####################################################
#Filename: Classwork5.2.sh
#Author: Anthony Vandergriff (VANDERGRIFF@ETSU.EDU)
#Class: CSCI-3600-001 Computer Scripting
#Created: 9/21/2022
#Updated: 9/23/2022
####################################################
#!/bin/bash
inet=$(ifconfig | grep -i "inet ")
inet6=$(ifconfig | grep -i "inet6")
inetchange=$(ifconfig | grep -i -c "inet ")
echo "IPv4 Addresses:"
echo "$inet"
echo "IPv6 Addresses"
echo "$inet6"