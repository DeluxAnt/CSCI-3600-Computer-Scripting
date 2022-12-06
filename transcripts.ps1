function calculations {
            $grade = "F"
            if ($_.value -ge 60) { $grade = "D" }; if ( $_.value -ge 67 ) { $grade = "D+" }
            if ($_.value -ge 70) { $grade = "C-" }; if ( $_.value -ge 73 ) { $grade = "C" }; if ($_.value -ge 77) { $grade = "C+"}
            if ($_.value -ge 80) { $grade = "B-" }; if ( $_.value -ge 83 ) { $grade = "B" }; if ($_.value -ge 87) { $grade = "B+"};
            if ($_.value -ge 90) { $grade = "A" }; if ( $_.value -ge 93 ) { $grade = "A" }
            write-host $("{0,10}`t{1,-25}{2,5}{3,10}{4,20}" -f $coursecodes[$_.key], $_.key, $_.value, $grade, $coursehour[$_.key])
}


$coursecodes = @{"Computer Scripting"= "CSCI-3600"; "Cloud Computing"="CSCI-4657"; "Info-Sec"= "CSCI-3500";"Networking Fundamentals"= "CSCI-3400"}
$coursehour = @{"Computer Scripting"= 3; "Cloud Computing"=3; "Info Sec"= 3; "Networking Fundamentals"= 3;}

$student = @{}; $semester = @{}; $degree = @{}
$score = @{"Computer Scripting"= 85; "Cloud Computing" = 90; "Info Sec" = 95;}
$student.add("John Doe",$score)
$semester.add("John Doe","Fall 2022")
$degree.add("John Doe","BS in Computer Science")

$score = @{"Computer Scripting"= 86; "Networking Fundamentals"= 92; "Info Sec"= 82;}
$student.add("Steeve Allee", $score)
$semester.add("steeve Allee", "Fall 2022")
$degree.add("Steeve Alleee", "BS in Computer Science")

$student.GetEnumerator() | % {
    write-host $("{0,45}" -f "Transcript") "`n`n"
    write-host "Student Name:`t" $_.key "`nSemester: `t" $semester[$_.key] "`nDegree: `t" $degree[$_.key] "`n`n"
    write-host $("{0,10}`t{1,-25}{2,5}{3,10}{4,20}" -f "Course Code", "Course Name", "Score", "Grade", "Credit Hours")
    $sum=0;$count=0
    foreach ($course in $_.value) {
        $course.GetEnumerator() | % {
            #$grade = "F" #replace following grade calculations with the function
            calculations
            $sum += $_.value; $count++

        }
    }
    $avg=$sum/$count; write-host $("{0,10}{1,5}" -f "`nAverage Score: ", [math]::Round($avg,2) ); "`n"
}