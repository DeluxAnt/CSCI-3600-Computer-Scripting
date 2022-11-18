write-host "There are a total of $($args.count) arguments"
if($args.Contains("-u")) { echo $env:USERNAME }
if($args.Contains("-p")) { echo $pwd }
for ( $i = 0; $i -lt $args.Count; $i++) {
    Write-Host "Argument $i is $($args[$i])"
    
}

