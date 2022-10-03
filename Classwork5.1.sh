####################################################
#Filename: Classwork5.1.sh
#Author: Anthony Vandergriff (VANDERGRIFF@ETSU.EDU)
#Class: CSCI-3600-001 Computer Scripting
#Created: 9/23/2022
#Updated: 9/23/2022
###########Create 4.2 using functions###############
####################################################
#!/bin/bash

day=""

function to_lower {
    input="$1"
    output=$(tr [A-Z] [a-z] <<< "$input")
    echo $output
}

function daylogic {
    echo "Enter the number corresponding to the day you want"
    echo "1) Sunday"
    echo "2) Monday"
    echo "3) Tuesday"
    echo "4) Wednesday"
    echo "5) Thurdsay"
    echo "6) Friday"
    echo "7) Saturday"
    read -sn 1
    REPLY=$(to_lower "$REPLY")
    case "$REPLY" in
        1) echo "You selected Sunday" ;;
        2) echo "You selected Monday" ;;
        3) echo "You selected Tuesday" ;;
        4) echo "You selected Wednesday" ;;
        5) echo "You selected Thurdsay" ;;
        6) echo "You selected Friday" ;;
        7) echo "You selected Saturday" ;;
    esac
}


while true
do
    clear
    echo "Enter u,d or p"
    echo "u: username"
    echo "d: output day"
    echo "p: working directory"
    read -sn1
    REPLY=$(to_lower "$REPLY")
    case "$REPLY" in
        u) echo $USER;;
        d) daylogic;;
        p) echo $PWD;;
    esac
    read -n1 -p "Press any key to continue"
done
