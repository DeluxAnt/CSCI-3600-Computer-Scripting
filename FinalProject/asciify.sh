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
