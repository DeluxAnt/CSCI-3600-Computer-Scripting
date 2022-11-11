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
RbgPixelValue=$(convert $1 -format "%[pixel:p{$i,$j}]" info: | awk 'BEGIN { FS = "b"} ; {print $2}')


for ((i=0;i<=$hight;i++)) do
    for ((j=0;j<=$width;j++)) do
        matrix[$i,$j]=$RbgPixelValue
    done
done

f1="%$((${#hight}+1))s"
f2=" %9s"

printf "$f1" ''
for ((i=1;i<=$hight;i++)) do
    printf "$f2" $i
done
echo


for ((j=1;j<=$width;j++)) do      ###TRANSPOSOES MATRIX###
    printf "$f1" $j
   for ((i=1;i<=$hight;i++)) do
       printf "$f2" ${matrix[$i,$j]}
   done
  echo
done
