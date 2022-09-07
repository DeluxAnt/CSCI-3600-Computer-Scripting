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
#   2.5 Int args must be through 1-7 (DONE)
#   3.if -d doesnt have any options then echo 'missing
# argumenets' and echo valid options (DONE)
#   4. if -udp, options is selected, it should give
# out for all the options. Similarly it should respond
# to all possible options, link -ud, -up, ect. (DONE(but not to spec))
####################################################

#!/bin/bash
#Classwork2.2.sh -u -d 3 -p

weekdays=(filler Sunday Monday Tuesday Wednesday Thurdsay Friday Saturday)

red='\033[0;31m'
clear='\033[0m'
min=1
max=7

while getopts ":d:up" opt; do
  case $opt in
    d)
        #echo "-d was triggered, Parameter: $OPTARG" >&2            #debugging
        if [[ $OPTARG = *[[:digit:]]* ]] && [ "$OPTARG" -le "$max" ] && [ "$OPTARG" -ge "$min" ];                    #tests for digit and >, <, array limits
            then
                #is number
                echo ${weekdays[$OPTARG]}

            else
                #not number
                echo -e "${red}INVALID ARGUMENT${clear}"
                echo -e "${red}Valid arguemts '1-7'${clear}" 
            fi
        shift;;
    u)
        echo $USER;;
    p) 
        echo $PWD;;
    
    \?)
      echo "Invalid option: -$OPTARG" >&2                   #not sure how to redirect non ints to here
      exit 1 
      ;;
    :)
      echo -e "${red}Option -$OPTARG requires an argument 1-7.${clear}" >&2
      exit 1
      ;;
  esac
done

if [ $# -eq 0 ]; then
    echo -e "${red}No arguments provided${clear}"
    echo -e "${red}Accepted arguments: -u -d 'INT' -p${clear}"
    exit 1
fi


echo "thank you for using my program"