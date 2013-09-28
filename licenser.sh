#/bin/bash

//A script to add license to start of all the php files 

[ -f license ] || echo "can't find the license file required to append license "

for a in *php
do
    echo "adding license to $a"
    cat license $a > temp
    mv temp $a
done

