####################################################
#Filename: Classwork2.2.sh
#Author: Anthony Vandergriff (VANDERGRIFF@ETSU.EDU)
#Class: CSCI-3600-001 Computer Scripting
#Created: 9/7/2022
#Updated: 9/12/2022
###########           Goals              ###########
# 1. Add captial case statements for options
# 2. Add longhand options
# 3. Add functionality to place digit for -d anywhere (3 -d -p -u)
# https://www.tutorialspoint.com/unix_commands/getopt.htm
####################################################

#use line above shift to use arg in getopts to grab number through interation

#!/bin/bash
#Classwork2.2.sh -u -d 3 -p

weekdays=(filler Sunday Monday Tuesday Wednesday Thurdsay Friday Saturday)

red='\033[0;31m'
clear='\033[0m'
min=1
max=7

while getopts ":d:upUP" opt; do     #add option names here
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
    U)
        echo $USER;;
    P)
        echo $PWD;;

        #add capital D case
    
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
