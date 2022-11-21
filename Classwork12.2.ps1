$u = 0; $p = 0; $d = 0; $param = 0
foreach ($i in $args){
    if ($($i -eq "-upd") -or $i -eq "-udp" -or $i -eq "-pud" -or $i -eq "-pdu" -or $i -eq "-dup" -or $i -eq "-dpu") { $u = 1; $d = 1; $p = 1 }
    if ($i -eq "-u" -or $i -eq "-up" -or $i -eq "-ud" -or $i -eq "-pu" -or $i -eq "-du") { $u = 1 }
    if ($i -eq "-p" -or $i -eq "-pu" -or $i -eq "-pd" -or $i -eq "-up" -or $i -eq "-dp") { $p = 1 }
    if ($i -ge 1 -and $i -le 7) { if ($param -ne 0) {$param = $i} }
    if ($i -gt 8 -or $i -lt 1) { $param = -1 }
}
if ($param -lt 0) {
    if ($param -eq -1) {"Argument for d option is out of range" }
    "`nThe usage of this function is:"
    "    Use -d for day of the week option"
    "    Use number between the range [1-8] for valid inoput for -d option"
}
else {
    if ($u -eq 1) {$env:USERNAME}
    if ($p -eq 1) {$PWD}
    if ($param -eq 1) {"The day is Sunday"}
        elseif($param -eq 2) {"The day is Monday"}
        elseif($param -eq 3) {"The day is Tuesday"}
        elseif($param -eq 4) {"The day is Wednesday"}
        elseif($param -eq 5) {"The day is Thursday"}
        elseif($param -eq 6) {"The day is Friday"}
        elseif($param -eq 7) {"The day is Saturday"}
        elseif($param -eq 8) {"The day is sunday"}
}
    