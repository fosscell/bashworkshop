## bash script to simulate uniq command also to introduce the concept of loops, conditional statements etc.

#!/bin/bash

prev=""

while read ine
do
        if [ "$prev" != "$ine" ] && [ "$prev" != "" ]
        then
                echo $prev
        fi
        prev=$ine
done < $1

echo $prev
