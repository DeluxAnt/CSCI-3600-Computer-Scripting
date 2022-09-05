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
# argument and echo valid ones  (DONE)
#   3.if -d doesnt have any options then echo 'missing
# argumenets' and echo valid options (DONE)
#   4. if -udp, options is selected, it should give
# out for all the options. Similarly it should respond
# to all possible options, link -ud, -up, ect.
####################################################

#!/bin/bash
#Classwork2.2.sh -u -d 3 -p

weekdays=(filler Sunday Monday Tuesday Wednesday Thurdsay Friday Saturday)

while getopts "up:d:" o; do
    case "${o}" in
    u)  u=${OPTARG}
        echo $USER ;;
    p)  p=${OPTARG}
        echo $PWD ;;
    d) d=${OPTARG}
        echo "caught" ;;
    esac
    shift
done


if [ $# -eq 0 ]; then
    echo "No arguments provided"
    echo "Accepted arguments: -u -d 'INT' -p"
    exit 1
fi



while [ -n "$1" ]
do
    case "$1" in
        -u) echo $USER ;; 
        -d) if [ -z "$2" ]                                  #tests if empty
            then
                echo "MISSING ARGUMENTS"
                echo "Valid arguments '1-7'"
                exit 1
        
            fi

            if [[ $2 = *[[:digit:]]* ]];                    #tests for digit
            then
                #is number
                weekdays=("${weekdays[$2]}")
            else
                #not number
                echo "INVALID ARGUMENT"
                echo "Valid arguemts '1-7'"
                exit 1
            fi
            shift;;
        -p) pwd ;;
    esac
    shift
done

echo ${weekdays[$2]}

echo "thank you for using my program"