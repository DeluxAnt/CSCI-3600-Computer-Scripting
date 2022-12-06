####################################################
#Filename: asciify.sh
#Author: Anthony Vandergriff (VANDERGRIFF@ETSU.EDU)
#Class: CSCI-3600-001 Computer Scripting
#Created: 11/10/2022
#Goal: Turn images into ascii text
####################################################

#!/bin/bash
declare -A matrix

map='`^\",:;Il!i~+_-?][}{1)(|\\/tfjrxnuvczXYUJCLQ0OZmwqpdbkhao*#MW&8%B@$'

#add image valididity check and error code

size=$(identify $1 | awk '{print $3}')      #outputs 000x000, need to get hight/width variables
hight=$(echo $size | awk 'BEGIN { FS = "x" } ; { print $1 }')
width=$(echo $size | awk 'BEGIN { FS = "x" } ; { print $2 }')
echo 'Successfully loaded image!'
echo "Image Size: $hight x $width"

test=${matrix[$i,$j]}

for ((i=0;i<=hight;i++)) do
    for ((j=0;j<=width;j++)) do
        RbgPixelValue=$(convert $1 -format "%[pixel:p{$i,$j}]" info: | awk 'BEGIN { FS = "b"} ; {print $2}' | sed 's/,/+/g')    #much faster outside of loop (optimization)
        matrix[$i,$j]=$RbgPixelValue
        tupleSum=$(( ${matrix[$i,$j]} ))
        averageSum=$(( $tupleSum / 3 ))                       #adds and divides rbg tuples by 3 to get average
        test="$averageSum"                    #overwrites indexes with average value
       
    done
done


for ((i=0;i<=hight;i++)) do
   for ((j=0;j<=width;j++)) do
#    averageSum=$(( ${matrix[$i,$j]} / 3 ))
    
    echo $test
    done
done

f1="%$((${#hight}+1))s"
f2=" %9s"

printf "$f1" ''
for ((i=1;i<=hight;i++)) do
    printf "$f2" $i
done
echo

for ((j=1;j<=width;j++)) do
    printf "$f1" $j
    for ((i=1;i<=hight;i++)) do
        printf "$f2" ${matrix[$i,$j]}
    done
    echo
done