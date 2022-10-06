#!//bin/bash
awk 'BEGIN{FS="\n";RS=""; printf "\n%15s %16s\n", "Student Name", "Average Score"; average=0; }{
total=0
studentname=$1
for (i=0; ++i <= NF;){
    if (i!=1){
        n=split($i, score, " ")
        total += score[n]
    }
}
average =+ total/3
printf "%15s %7.2f\n", studentname, total/3
}
END { printf "\n%30s %4d", "Total Number of Students: ", NR
      printf "\n%30s %5.2f\n", "Average of all Students: ", average/NR
}' StudentsAwkEX.txt