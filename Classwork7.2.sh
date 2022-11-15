#!//bin/bash
name=$(cat transcript.txt | awk 'BEGIN { FS = "," } ; {print $1}')
semester='Fall 2022'
degree='BS in Computer Science'
class1=$(cat transcript.txt | awk 'BEGIN { FS = "," } ; { print $2 }')
name1=$(cat transcript.txt | awk 'BEGIN { FS = "," } ; { print $3 }')
s1=
g1=$(cat transcript.txt | awk 'BEGIN { FS = "," } ; { print $4 }')
ch1=$(cat transcript.txt | awk 'BEGIN { FS = "," } ; { print $5 }')

class2=$(cat transcript.txt | awk 'BEGIN { FS = "," } ; { print $6 }')
name2=$(cat transcript.txt | awk 'BEGIN { FS = "," } ; { print $7 }')
s2=
g2=$(cat transcript.txt | awk 'BEGIN { FS = "," } ; { print $8 }')
ch2=$(cat transcript.txt | awk 'BEGIN { FS = "," } ; { print $9 }')

class3=$(cat transcript.txt | awk 'BEGIN { FS = "," } ; { print $10 }')
name3=$(cat transcript.txt | awk 'BEGIN { FS = "," } ; { print $11 }')
s3=
g3=$(cat transcript.txt | awk 'BEGIN { FS = "," } ; { print $12 }')
ch3=$(cat transcript.txt | awk 'BEGIN { FS = "," } ; { print $13 }') 

echo "                  Transcript
    Student Name: $name
    Semester:     $semester
    Degree:       $degree

    Course Code     Course Name                 Score   Grade   Credit Hours
$class1         $name1                      $s1     $g1          $ch1
$class2         $name2                $s2     $g2          $ch2
$class3         $name3           $s3     $g3          $ch3

    Average Score: $average
    GPA:           $gpa
    "
    
awk '{print NR}' transcript.txt