/^<VirtualHost/,/^<\/VirtualHost/ {
    s/\t#Server/\tServer/
    s/html/html\/www.example.com/
    w template.txt
}