## bash script to simulate uniq command also to introduce the concept of loops, conditional statements etc.

#!/bin/bash

## to keep track of the previous input line
prev=""

## while loop continues till the whole input is read line by line
while read line         
do
        ## checks if the previous input is same as the current input
        if [ "$prev" != "$line" ] && [ "$prev" != "" ]          
        then
                ## print the uniq input to standard output
                echo $prev      
        fi
        prev=$ine
        ## updates the prev variable
done < $1       ## giving the file as input

echo $prev      ## echo the last uniq line
