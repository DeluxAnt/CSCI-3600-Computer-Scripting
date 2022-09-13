####################################################
#Filename: Classwork2.2.sh
#Author: Anthony Vandergriff (VANDERGRIFF@ETSU.EDU)
#Class: CSCI-3600-001 Computer Scripting
#Created: 9/7/2022
#Updated: 9/12/2022
###########           Goals              ###########
# 1. Add captial case statements for options (DONE)
# 2. Add longhand options (DONE)
# 3. Add functionality to place digit for -d anywhere (3 -d -p -u)
####################################################

#use line above shift to use arg in getopts to grab number through interation

#!/bin/bash
#Classwork2.2.sh -u -d 3 -p

weekdays=(filler Sunday Monday Tuesday Wednesday Thurdsay Friday Saturday)

red='\033[0;31m'
clear='\033[0m'
min=1
max=7

optspec=":upd:-:"
while getopts "$optspec" optchar; do
    case "${optchar}" in
        -)
            case "${OPTARG}" in
                day)
                    val="${!OPTIND}"; OPTIND=$(( $OPTIND + 1 ))
                    echo -e "Parsing option: '--${OPTARG}', value: '${red}error${clear}${val}'" >&2;
                    echo -e "${red}-ERROR CODE 3-${clear}"
                    echo -e "${red}Usage: --day <INT>${clear}"
                    echo -e "${red}INT range: 1-7${clear}"
                    exit 5;
                    ;;
                day=*)
                    val=${OPTARG#*=}
                    opt=${OPTARG%=$val}
                    echo "Parsing option: '--${opt}', value: '${val}'" >&2
                    ;;
                username)
                    echo $USER
                    ;;
                print)
                    echo $PWD
                    ;;
                *)
                    if [ "$OPTERR" = 1 ] && [ "${optspec:0:1}" != ":" ]; then
                        echo "Unknown option --${OPTARG}" >&2
                    fi
                    ;;
            esac;;
        u)
            echo $USER
            ;;
        p)
            echo $PWD
            ;;
        d)
             #echo "-d was triggered, Parameter: $OPTARG" >&2            #debugging
            if [[ $OPTARG = *[[:digit:]]* ]] && [ "$OPTARG" -le "$max" ] && [ "$OPTARG" -ge "$min" ];        #tests for digit and >, <, array limits
            then
                #is number
                echo ${weekdays[$OPTARG]}

            else
                #not number
                echo -e "${red}-ERROR CODE 1-${clear}"
                echo -e "${red}INVALID ARGUMENT: Valid arguemts '1-7'${clear}" 
            fi
            shift;;
    
        *)
            if [ "$OPTERR" != 1 ] || [ "${optspec:0:1}" = ":" ]; then #catches if d has no int need to fix
                echo -e "${red}-ERROR CODE 2-${clear}"
                echo -e "${red}Non-option argument: '-${OPTARG}'${clear}" >&2
            fi
            ;;
    esac
done


# VALID_ARGS=$(getopt -o :d:upUP --long :day:,username,print -- "$@")

# eval set -- "$VALID_ARGS"
# while [ : ]; do
#   case "$1" in
#     -d | --day)
#          #echo "-d was triggered, Parameter: $OPTARG" >&2            #debugging
#         if [[ $OPTARG = *[[:digit:]]* ]] && [ "$OPTARG" -le "$max" ] && [ "$OPTARG" -ge "$min" ];        #tests for digit and >, <, array limits
#             then
#                 #is number
#                 echo ${weekdays[$OPTARG]}

#             else
#                 #not number
#                 echo -e "${red}INVALID ARGUMENT${clear}"
#                 echo -e "${red}Valid arguemts '1-7'${clear}" 
#             fi
#         shift;;
#     -u | --username)
#         echo $USER
#         shift
#         ;;
#     -p | --print)
#         echo $PWD
#         shift 
#         ;;
#     -D)
#          #echo "-d was triggered, Parameter: $OPTARG" >&2            #debugging
#         if [[ $OPTARG = *[[:digit:]]* ]] && [ "$OPTARG" -le "$max" ] && [ "$OPTARG" -ge "$min" ];        #tests for digit and >, <, array limits
#             then
#                 #is number
#                 echo ${weekdays[$OPTARG]}

#             else
#                 #not number
#                 echo -e "${red}INVALID ARGUMENT${clear}"
#                 echo -e "${red}Valid arguemts '1-7'${clear}" 
#             fi
#         shift;;
#     -U)
#         echo $USER
#         shift
#         ;;
#     -P)
#         echo $PWD
#         shift 
#         ;;
#     ?)
#       echo "Invalid option: -$OPTARG" >&2                   #not sure how to redirect non ints to here
#       exit 1 
#       ;;
#     :)
#       echo -e "${red}Option -$OPTARG requires an argument 1-7.${clear}" >&2
#       exit 1
#       ;;
   
#     --) shift; 
#         break 
#         ;;
#   esac
# done

if [ $# -eq 0 ]; then
    echo -e "${red}No arguments provided${clear}"
    echo -e "${red}Accepted arguments: -u -d 'INT' -p${clear}"
    exit 1
fi


echo "thank you for using my program"
