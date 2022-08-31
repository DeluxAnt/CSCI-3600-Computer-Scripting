####################################################
#Filename: Classwork2.1.sh
#Author: Anthony Vandergriff (VANDERGRIFF@ETSU.EDU)
#Class: CSCI-3600-001 Computer Scripting
#Created: 8/29/2022
#Updated: 8/31/2022
####################################################

#!/bin/bash
#Classwork2.1.sh -u -d 3 -p

weekdays=(filler Sunday Monday Tuesday Wednesday Thurdsay Friday Saturday)

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