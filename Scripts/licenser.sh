#/bin/bash

//A script to add license to top part of all the php files inside a folder  
//This script is helpful to a add a part of to large no of files inside a folder 
[ -f license ] || echo "can't find the license file required to append license "

for a in *php
do
    echo "adding license to $a"
    cat license $a > temp
    mv temp $a
done

