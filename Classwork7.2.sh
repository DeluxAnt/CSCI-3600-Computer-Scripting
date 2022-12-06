#!/usr/bin/awk -f

BEGIN {
    FS="^$"
    RS=""
}

function gradeCalc(line) {

    numberCourses++
    Entry = split(line, entries, ",")
    courseNumber=entries[1]
    courseName=entries[2]
    Grade=entries[3]
    Credits=entries[4]

    gTotal+=Grade
    if(Grade >= 93.0){
        numberGrade=4
        letterGrade="A"
    }
    else if(Grade >= 90.0 && Grade < 92.9) {
        numberGrade=3.7
        letterGrade="A-"
    }
    else if(Grade >= 87.0 && Grade < 89.9) {
        numberGrade=3.3
        letterGrade="B+"
    }
    else if(Grade >= 83.0 && Grade < 86.9) {
        numberGrade=3.0
        letterGrade="B"
    }
    else if(Grade >= 80.0 && Grade < 82.9) {
        numberGrade=2.7
        letterGrade="B-"
    }
    else if(Grade >= 77.0 && Grade < 79.9) {
        numberGrade=2.3
        letterGrade="C+"
    }
    else if(Grade >= 73.0 && Grade < 76.9) {
        numberGrade=2.0
        letterGrade="C"
    }
    else if(Grade >= 70.0 && Grade < 72.9) {
        numberGrade=1.7
        letterGrade="C-"
    }
    else if(Grade >= 67.0 && Grade < 69.9) {
        numberGrade=1.3
        letterGrade="D+"
    }
    else if(Grade >= 60.0 && Grade < 66.9) {
        numberGrade=1.0
        letterGrade="D"
    }
    else if(Grade < 59.9) {
        numberGrade=0.7
        letterGrade="F"
    }
    score = numberGrade * Credits
    cTotal+=Credits
    sTotal+=score
    printf("%-16s%-33s%-9s%-8s%5s\n", courseNumber, courseName, Grade, letterGrade, Credits)

}
{ 
    gTotal=0
    sTotal=0
    cTotal=0
    numberCourses=0
    lineNumber = split($1, lines, "\n")
    Entry = split(lines[1], entries, ",")
    name=entries[1]
    major=entries[2]
    semester=entries[3]



    printf("\n\n\t\t\t\tTranscript\n\nStudent Name:\t%-10s\nSemester:\t%-15s\nDegree:\t\t%-15s\n", name, semester, major)
    printf("\nCourse Code\tCourse Name\t\t\tScore\tGrade\tCredit Hours\n")



    for (i=2; i < lineNumber+1; i++)
    {
        gradeCalc(lines[i])
    }


    gpa=sTotal/cTotal
    printf("\n\nAverage Score: %.2f\n", gTotal/numberCourses)
    printf("GPA:%16.2f\n", gpa)
}



END {

}