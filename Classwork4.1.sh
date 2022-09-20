####################################################
#Filename: Classwork4.1.sh
#Author: Anthony Vandergriff (VANDERGRIFF@ETSU.EDU)
#Class: CSCI-3600-001 Computer Scripting
#Created: 9/12/2022
#Updated: 9/12/2022
###########           Goals              ###########
# 1. Write you previous program with minimal number of statements.
# 2. You are not allowed to use similar statements multiple times.
# 3. If there is any one of the option is invalid, you should not display 
#    valid options. For example if the options pdi since i is invalid, you 
#    should not display answer for p and d. should not be any valid answers.
# 4. At least 8 different types of error codes 
# 3. Add functionality to place digit for -d anywhere (3 -d -p -u)
####################################################

#use line above shift to use arg in getopts to grab number through interation (prof pic related)

#!/bin/bash
#Classwork2.2.sh -u -d 3 -p

weekdays=(filler Sunday Monday Tuesday Wednesday Thurdsay Friday Saturday)

red='\033[0;31m'
clear='\033[0m'
min=1
max=7

U=0 ; P=0 ; D=0 ; error=0 ; index=0

errorstring="-ERROR CODE"

optspec=":upd:-:"
while getopts "$optspec" optchar; do
    echo ${optchar} | tr 'A-Z' 'a-z'            #doesnt take uppercase letters
    case "${optchar}" in
        -)
            case "${OPTARG}" in
                day)
                    ((D+=1));;
                username)
                    ((U+=1));;
                print)
                    ((P+=1));;
            esac;;
        u)
            ((U+=1));;
        p)
            ((P+=1));;
        d)
            ((D+=1));;
             #echo "-d was triggered, Parameter: $OPTARG" >&2            #debugging
            #if [[ $OPTARG = *[[:digit:]]* ]] && [ "$OPTARG" -le "$max" ] && [ "$OPTARG" -ge "$min" ];        #tests for digit and >, <, array limits
            #then
            #    #is number
            #    echo ${weekdays[$OPTARG]}
            #
            #else
            #    #not number
            #    echo -e "${red}-ERROR CODE 1-${clear}"                                                      #ERROR CODE 1
            #    echo -e "${red}INVALID ARGUMENT: Valid arguemts '1-7'${clear}" 
            #fi
            #shift
    
        *)
            if [ "$OPTERR" != 1 ] || [ "${optspec:0:1}" = ":" ]; then                                       #catches if d has no int need to fix
                echo -e "${red}-ERROR CODE 2-${clear}"                                                      #ERROR CODE 2
                echo -e "${red}Non-option argument: '-${OPTARG}'${clear}" >&2
            fi
            ;;
    esac
done

if [ $U -eq 1 ]; then
    echo $USER
elif [ $U -gt 1 ]; then 
    error=7
fi

if [ $P -eq 1 ]; then
    echo $PWD
elif [ $P -gt 1 ]; then
    error=6
fi

if [ $D -eq 1 ]; then
    for var in $*; do
        if [[ $var = *[[:digit:]]* ]] && [ "$var" -le "$max" ] && [ "$var" -ge "$min" ];        #skips over other flags ((-d -p 1) p doesnt work)
            then
                #is number
                echo ${weekdays[$var]}              

            #else
                #not number
            #   error=1
        fi
    done
elif [ $D -gt 1 ]; then         #doesnt hit when more than one d 
    error=8
fi

if [ $# -eq 0 ]; then
   error=4
fi

case $error in
    1) echo $errorstring" 1-"$'\n'"INVALID ARGUMENT: Valid arguemts '1-7'"; exit 1;;
    2) echo $errorstring" 2-"$'\n'"Non-option argument"; exit 1;;
    3) echo $errorstring" 3-"$'\n'"Usage: --day <INT>"$'\n'"INT range: 1-7"; exit 1;;
    4) echo $errorstring" 4-"$'\n'"No arguments provided"$'\n'""; exit 1;;
    5) echo $errorstring" 5-"$'\n'"Accepted arguments: -u -d 'INT' -p"; exit 1;;
    6) echo $errorstring" 6-"$'\n'"More than one type of -p used"; exit 1;;
    7) echo $errorstring" 7-"$'\n'"More than one type of -u used"; exit 1;;
    8) echo $errorstring" 8-"$'\n'"More than one tyoe if -d used"; exit 1;;
esac

echo "thank you for using my program"
