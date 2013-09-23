#!/bin/bash
#A very simple pronunciation tool l

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

#checks if the word was actually available else throws an error
if [[ $k -gt 0 ]];
then 
    echo ".........oops, cant find word "$1;
    return
fi

#download the file 
wget -q -O $dir/$1.ogg http:$m 

ans="y"

#while loop 
#while [[ $ans =~ [yY].* ]]
while [[ $ans == y ]]
do
    #mplayer is one of the default audio player in linux
    mplayer $dir/$1.ogg 2>/dev/null 1>/dev/null
    
    echo "do you want me to play it again [y] / [n] ? "
    
    #read user input
    read ans
done

#remove the file from temp folder
rm $dir/$1.ogg


#Exit 
echo -e "\n Exitting ...\n"
