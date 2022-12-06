BEGIN {
}
match($0, /[a-z]+\.[a-z]+/) {
    website = substr($0, RSTART, RLENGTH)
    domains[website]++
}
match($0, /[0-9]{1,3}\.[0-9]{1,3}\./) {
    ip = substr($0, RSTART, RLENGTH)
    if (ip == "151.141.")
    {
       domains["etsu.edu"]++ 
    }
    else
    {
        domains[ip]++
    }
}

match($0, /\t:0/) {
    domains["etsu.edu"]++ 
}
END {
    for (i in domains)
    {
        printf "%10s %20s\n", domains[i], i  
    }
}