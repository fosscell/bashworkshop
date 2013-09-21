#!/bin/bash

#A very simple dictionary inside terminal 

#Creating a temp folder 
dir=~/.dict

#Check for the existence if not create one
[[ -d $dir ]] || mkdir $dir


#download respective file from dictionary dot com 
# -q => do it quietly ie nothing @ screen 
# -O save it as mean
wget -q -O $dir/pron http://en.wiktionary.org/wiki/$1

#Please DONT hardcode the value, give it to variable and then use it 
file=$dir/pron

#greping out result
m=$(cat $file | grep -Po '//upload.*.ogg' | grep -v type)

#saving the error code 
k=$(echo $?)

wget -q -O $dir/$1.ogg http:$m 
mplayer $dir/$1.ogg
rm $dir/$1.ogg
#echoing
#echo "Meaning of the word "$1" is"$m

#checks if the word was actually available else throws an error
if [[ $k -gt 0 ]]; 
then 
    echo ".........oops, cant find word "$1;
fi

