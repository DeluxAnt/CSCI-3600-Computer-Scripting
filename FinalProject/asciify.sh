####################################################
#Filename: asciify.sh
#Author: Anthony Vandergriff (VANDERGRIFF@ETSU.EDU)
#Class: CSCI-3600-001 Computer Scripting
#Created: 11/10/2022
#Goal: Turn images into ascii text
####################################################

#!/bin/bash

#add image valididity check and error code

size=$(identify $1 | awk '{print $3}')      #outputs 000x000, need to get hight/width variables
hight=$(echo $size | awk 'BEGIN { FS = "x" } ; { print $1 }')
width=$(echo $size | awk 'BEGIN { FS = "x" } ; { print $2 }')
echo 'Successfully loaded image!'
echo "Image Size: $hight x $width"

declare -A matrix
num_rows=$hight
num_columns=$width

function Pdataloop {
    
}


for ((i=1;i<=num_rows;i++)) do
    for ((j=1;j<=num_columns;j++)) do
        matrix[$i,$j]=$RANDOM
    done
done

f1="%$((${#num_rows}+1))s"
f2=" %9s"

printf "$f1" ''
for ((i=1;i<=num_rows;i++)) do
    printf "$f2" $i
done
echo


#for ((j=1;j<=num_columns;j++)) do      ###TRANSPOSOES MATRIX###
#    printf "$f1" $j
#   for ((i=1;i<=num_rows;i++)) do
#       printf "$f2" ${matrix[$i,$j]}
#   done
#  echo
#done
