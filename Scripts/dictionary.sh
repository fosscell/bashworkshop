#!/bin/bash

#A very simple dictionary inside terminal 

#Creating a temp folder 
dir=~/.dict

#Check for the existence of directory, if not present create one
[[ -d $dir ]] || mkdir $dir


#download respective file from dictionary dot com 
# -q => do it quietly ie nothing @ screen 
# -O save it as mean
wget -q -O $dir/mean http://dictionary.reference.com/browse/$1

#Please DON'T hard code the value, give it to variable and then use it 
file=$dir/mean

#grepping out result
m=$(cat $file | grep description | grep -Po 'content=.*.*See more' | grep -Po '\,.*.\.')

#saving the error code 
k=$(echo $?)

#echoing
echo "Meaning of the word "$1" is"$m

#checks if the word was actually available else throws an error
if [[ $k -gt 0 ]]; 
then 
    echo ".........oops, cant find word "$1;
fi

