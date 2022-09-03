####################################################
#Filename: Classwork2.2.sh
#Author: Anthony Vandergriff (VANDERGRIFF@ETSU.EDU)
#Class: CSCI-3600-001 Computer Scripting
#Created: 9/3/2022
#Updated: 9/3/2022
###########           Goals              ###########
#   1.if no arguments notify missing argumenets and 
# echo available parameters (DONE)
#   2.if -d has invalid arguments echo the invalid 
# argument and echo valid ones 
#   3.if -d doesnt have any options then echo 'missing
# argumenets' and echo valid options
#   4. if -udp, options is selected, it should give
# out for all the options. Similarly it should respond
# to all possible options, link -ud, -up, ect.
####################################################

#!/bin/bash
#Classwork2.2.sh -u -d 3 -p

weekdays=(filler Sunday Monday Tuesday Wednesday Thurdsay Friday Saturday)

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    echo "Accepted arguments: -u -d 'INT' -p"
    exit 1
fi



while [ -n "$1" ]
do
    case "$1" in
        -u) echo $USER ;; 
        -d) param="$2"
            weekdays=("${weekdays[$2]}")
            shift;; 
        -p) pwd ;;
    esac
    shift
done

echo ${weekdays[$2]}

echo "thank you for using my program"