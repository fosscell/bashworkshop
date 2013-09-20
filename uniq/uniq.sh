#!/bin/bash

prev=""

while read line
do
        if [ "$prev" != "$line" ] && [ "$prev" != "" ]
        then
                echo $prev
        fi
        prev=$line
done < $1

echo $prev